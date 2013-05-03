set :application, "qrcode"
set :repository,  "https://github.com/tthomas48/qrcode"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "root"
set :deploy_to, "/var/www/rails/qrcode"
server "loadedguntheory.com", :app, :web, :db, :primary => true

set :use_sudo, false

#role :web, "loadedguntheory.com"                          # Your HTTP server, Apache/etc
#role :app, "loadedguntheory.com"                          # This may be the same as your `Web` server
#role :db,  "loadedgunteory.com", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

set :default_environment, {
  'PATH' => "/usr/local/rvm/gems/ruby-1.9.2-p290/bin:/usr/local/rvm/gems/ruby-1.9.2-p290@global/bin:/usr/local/rvm/rubies/ruby-1.9.2-p290/bin:/usr/share/ruby-rvm/bin:$PATH",
  'RUBY_VERSION' => 'ruby 1.9.2',
  'GEM_HOME' => '/usr/local/rvm/gems/ruby-1.9.2-p290',
  'GEM_PATH' => '/usr/local/rvm/gems/ruby-1.9.2-p290'
}


require "bundler/capistrano"
before "deploy:assets:precompile", "bundle:install"
load 'deploy/assets'


# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do
    run "ln -nfs /var/www/rails/config/bitly.rb #{release_path}/config/initializers/bitly.rb"
    run "ln -nfs /var/www/rails/config/survey.rb #{release_path}/config/initializers/survey.rb"
  end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "ln -nfs /var/www/rails/config/qrcode_production.rb #{release_path}/config/environments/production.rb"
    run "ln -nfs /var/www/rails/config/bitly.rb #{release_path}/config/initializers/bitly.rb"
    run "ln -nfs /var/www/rails/config/survey.rb #{release_path}/config/initializers/survey.rb"
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
