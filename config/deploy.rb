require 'mina/rails'
require 'mina/git'
require 'mina/bundler'
require 'mina/puma'
require 'mina/rbenv'

set :application_name, 'bmenglish'
set :domain, '106.15.88.13'
set :deploy_to, '/home/deployer/www/bmenglish'
set :repository, 'https://github.com/cisolarix/bmenglish'
set :branch, 'master'

set :user, 'deployer'
set :forward_agent, true
set :term_mode, nil
set :force_asset_precompile, true

# shared dirs and files will be symlinked into the app-folder by the 'deploy:link_shared_paths' step.
# set :shared_dirs, fetch(:shared_dirs, []).push('somedir')
# set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/secrets.yml')
set :shared_paths, fetch(:shared_dirs, []).push('tmp', 'log', 'public/uploads', 'public/packs')
set :shared_files, fetch(:shared_files, []).push(
  'config/database.yml',
  'config/application.yml',
  'config/secrets.yml',
  'config/puma.rb'
)

# This task is the environment that is loaded for all remote run commands, such as
# `mina deploy` or `mina rake`.
task :remote_environment do
  invoke :'rbenv:load'
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  # command %{rbenv install 2.3.0}
end

desc 'Deploys the current version to the server'
task :deploy do
  invoke :'git:ensure_pushed'
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    queue  'bower install --allow-root'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      invoke :'puma:restart'
    end
  end
end
