# Usage:
# cap deploy:setup
# cap deploy
#
# See end for links

set :application, "caseywat.so"
set :repository,  "git@github.com:watsoncj/caseywat.so.git"

# some like to utilize a cache to speed up checkout/clone
#set :deploy_via, :remote_cache

# If you're stuck with an old version of git on the server you might need this
set :scm_verbose, true
set :scm, :git

set :ssh_options, {:forward_agent => true} # enable private keys with git


# show password requests on windows (http://weblog.jamisbuck.org/2007/10/14/capistrano-2-1)
default_run_options[:pty] = true

# Select git branch
set :branch, "master"

# where to deploy your uploaded application
set :deploy_to, "/var/#{application}"
# point your document root here (but add /current after this path)
set :document_root, "/var/#{application}/public"

role :app, "caseywat.so" # or an IP-address, or your hosts servername 
role :web, "caseywat.so"
role :db,  "caseywat.so", :primary => true

# SSH login credentials (or better yet; use passwordless authentication)
#set :user, "sshuser"
#set :password, "sshpassword"

set :use_sudo, false # in case you do not have root access

# Inspirational URLs:
# http://weblog.jamisbuck.org/search?q=capistrano
# http://www.claytonlz.com/index.php/2008/08/php-deployment-with-capistrano/
# http://paulschreiber.com/blog/2009/03/15/howto-deploy-php-sites-with-capistrano-2/
# http://wiki.dreamhost.com/index.php/Capistrano
# http://www.capify.org/index.php/Getting_Started
# http://www.jonmaddox.com/2006/08/16/automated-php-deployment-with-capistrano/
# http://github.com/leehambley/railsless-deploy
# http://help.github.com/msysgit-key-setup/
# http://help.github.com/capistrano/

#set :application, "casetwat.so"
#set :repository,  "caseywat.so:/home/git/caseywat.so.git"
#
#set :scm_verbose, true
#set :ssh_options, {:forward_agent => true}
#default_run_options[:pty] = true
#set :branch, "master"
#set :deploy_to, "/var/#{application}"
##set :scm, :git
## Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
#
#role :web, "caseywat.so"                          # Your HTTP server, Apache/etc
#role :app, "caseywat.so"                          # This may be the same as your `Web` server
#role :db,  "caseywat.so", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

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
