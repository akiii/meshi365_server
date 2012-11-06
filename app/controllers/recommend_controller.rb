class RecommendController < ApplicationController

  require 'AmenityGroup'
  require 'PreparationRecommendStore'

  AMENITY_COUNT = 4

  def decide_group_all_users
    users = User.all
    users.each do |u|
      # userが写真を1回でも投稿したことがあるか確認
      if u.food_pictures.count > 0
        amenity_counts = []
        amenity_groups = []
     
        # userの投稿で店のジャンル(ファーストフード、レストランなど)ずつの個数を求める
        for i in 0..4-1
          amenity_counts << 0
          amenity_groups << AmenityGroup.create(:id => i, :parcentage => 0)
        end
        u.food_pictures.each do |p|
          amenity_counts[p.amenity] += 1
        end

        # userが各店のジャンルにどれくらい行っているかを求める( % )
        for i in 0..4-1
          amenity_groups[i].parcentage = 100 * amenity_counts[i] / (u.food_pictures.count * 1.0)
        end

        # 店のジャンルのパーセンテージをsort
        # amenity_groups[0]が最も行っているジャンルとパーセンテージになる
        amenity_groups.sort_by do |g1|
          g1.parcentage
        end
        # ジャンルが自炊(id == 0 のとき自炊)でなければuserが属するgroupを決定
	high_amenity_group = amenity_groups[amenity_groups.count-1]
        if high_amenity_group.id != 0
          group = Group.find(:first, :conditions => ["amenity = ? and min_parcentage <= ? and max_parcentage >= ?", high_amenity_group.id, high_amenity_group.parcentage, high_amenity_group.parcentage])
	  relationship = GroupRelationship.find_by_user_id(u.id)
	  relationship = GroupRelationship.new if !relationship
	  relationship.user_id = u.id
	  relationship.group_id = group.id
	  # save
	  relationship.save
	end
      end
    end
  end

  def create_store_ranking_all_groups
    groups = Group.all
    groups.each do |g|
      # key に store_name, value に PreparationRecommendStore の インスタンスのハッシュを定義
      stores_hash = {}
      store = PreparationRecommendStore.new
      # groupの全userのfood picturesをクロール
      g.users.each do |u|
        u.food_pictures.each do |p|
	  # クロール中に初めて出た店ならばインスタンス生成、ハッシュに追加
          unless stores_hash.key? store_name
            store = PreparationRecommendStore.new
	    store.name = store_name
	    store.all_star_num = 0
            store.highest_star_num = 0
            store.file_name = ""
            store.user_gone_count = 0
            stores_hash[store_name] = store
	  end
	  # ハッシュの PreparationRecommendStore のインスタンスの情報の更新
          store = stores_hash[store_name]
	  store.all_star_num += p.star_num
          if store.highest_star_num < p.star_num
            store.highest_star_num = p.star_num
            store.file_name = p.file_name
          end
	  store.user_gone_count += 1
	  stores_hash[store_name] = store
	end
      end

      # groupの探索が終わったらハッシュに入っているstore情報をデータベースに保存する、あれば更新
      stores_hash.each_value do |store|
        recommend_store = RecommendStore.find_by_group_id_and_name(g.id, store.name)
	recommend_store = RecommendStore.new if !recommend_store
	recommend_store.group_id = g.id
        recommend_store.name = store.name
	recommend_store.average_star_num = store.all_star_num / (store.user_gone_count * 1)
	recommend_store.file_name = store.file_name
	# save
	recommend_store.save
      end
    end
  end

  def maintenance
    decide_group_all_users
    create_store_ranking_all_groups
    render :json => true
  end

  def group_stores
    user = User.find_by_uiid(params[:uiid])
    relationship = GroupRelationship.find_by_user_id(user.id)
    recommend_stores = []
    if relationship
      group = Group.find(relationship.group_id)

      # groupのuserが行ったすべてのお店
      recommend_stores = RecommendStore.find(:all, :conditions => { :group_id => group.id }, :order => "average_star_num desc")

      # userが行ったお店の名前の配列
      wentToStores = user.food_pictures.map(&:store_name)

      recommend_stores.delete_if do |s|
        wentToStores.include? s.name
      end
    end
    render :json => recommend_stores
  end

end
