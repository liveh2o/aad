$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require 'rvm/capistrano'                               # Load RVM's capistrano plugin.

# Define RVM settings
set :rvm_ruby_string, '1.9.2'
set :rvm_type, :user

set :application, "aad"

set :scm, :git
set :repository,  "git@github.com:clearelement/aad.git"
set :branch, "master"
set :deploy_via, :remote_cache

set :use_sudo, false
set :deploy_to, "/var/www/arthuradesign.com/"
ssh_options[:forward_agent] = true

server "dev.clearelement.co", :app, :web, :db, :primary => true

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  desc "Install bundled gems into vendor"
  task :bundle do
    run "cd #{release_path}; bundle install --path vendor --without development test"
  end

  desc "Sets up the environment."
  task :configure, :roles => :app do
    run "cp #{shared_path}/config/* #{release_path}/config/"
    run "ln -s #{shared_path}/ruby #{release_path}/vendor/ruby"
  end
  
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
before "deploy:assets:precompile", "deploy:bundle"
before "deploy:bundle", "deploy:configure"