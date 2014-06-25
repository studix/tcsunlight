require 'bundler/capistrano'
set :scm, :git
set :repository, "git@github.com:studix/tcsunlight.git" 
set :branch, "master"

require '../credentials/sample_app.rb'

set :server_name, 'studix.railsplayground.net'
set :application, 'tcsunlight'
set :normalize_asset_timestamps, false 


set :use_sudo, false
set :group_writable, false
default_run_options[:pty] = true

role :app, server_name
role :web, server_name
role :db, server_name, :primary => true

# set the proper permission of the public folder
task :after_update_code, :roles => [:web, :db, :app] do
run "chmod 755 #{release_path}/public"
end

#############################################################
#	Passenger
#############################################################
namespace :passenger do
  desc "Restart Application"  
  task :restart do  
    run "touch #{current_path}/tmp/restart.txt"  
  end
end

after :deploy, "passenger:restart"