=begin
set :application, "set your application name here"
set :repository,  "set your repository location here"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "your web-server here"                          # Your HTTP server, Apache/etc
role :app, "your app-server here"                          # This may be the same as your `Web` server
role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
=end

require 'capistrano_colors'

#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
set :rvm_ruby_string, '1.9.3-p194'
#set :rvm_type, 'ec2-user'
require 'rvm/capistrano'

set :application, "meal_diary"
set :repository,  "https://github.com/akiii/meshi365_server.git"
set :branch, "master"
set :scm, :git

set :rails_env, "production"
set :user, "ec2-user"
set :use_sudo, false
set :deploy_to, "/home/ec2-user/apps/#{application}"
set :normalize_asset_timestamps, false
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "ec2-54-242-232-66.compute-1.amazonaws.com"                          # Your HTTP server, Apache/etc
role :app, "ec2-54-242-232-66.compute-1.amazonaws.com"                          # This may be the same as your `Web` server
role :db,  "ec2-54-242-232-66.compute-1.amazonaws.com", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

#require 'capistrano-unicorn'
