set :application, "aad"

set :scm, :git
set :repository,  "git@github.com:clearelement/aad.git"
set :branch, "master"
set :deploy_via, :remote_cache

set :use_sudo, false
set :deploy_to, "/var/www/arthuradesign.com/"
ssh_options[:forward_agent] = true

server "ce01.clearelement.co", :app, :web, :db, :primary => true

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  desc "Install bundled gems into vendor"
  task :bundle do
    run "cd #{release_path}; bundle install --path vendor --without development test"
  end

  desc "Sets up the environment."
  task :configure, :roles => :app do
    #run "cp #{shared_path}/config/* #{release_path}/config/"
    run "ln -s #{shared_path}/ruby #{release_path}/vendor/ruby"
  end
  
  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path}; passenger start -e production -d"
  end
  task :stop do
    run "cd #{current_path}; passenger stop"
  end
  task :restart do
    deploy.stop
    deploy.start
  end
end
before "deploy:assets:precompile", "deploy:bundle"
before "deploy:bundle", "deploy:configure"