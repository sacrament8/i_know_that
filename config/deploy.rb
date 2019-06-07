# config valid only for current version of Capistrano
lock '3.6.0'

set :application, 'i_know_that'
set :repo_url, 'https://github.com/sacrament8/i_know_that'

set :branch, ENV['BRANCH'] || 'master'

set :deploy_to, '/var/www/i_know_that'
set :linked_files, %w{.env config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/uploads}
set :keep_releases, 5
set :rbenv_ruby, '2.5.3'
set :rbenv_type, :system
set :log_level, :info


namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
  task :db_reset do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:migrate:reset"
        end
      end
    end
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env:fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end
  after :publishing, :restart
  before :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
  before :publishing, 'db:seed_fu'
  desc 'Load seed data into database'
  task :seed_fu do
    on roles(fetch(:seed_fu_roles) || :app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, :rails, 'db:seed_fu'
        end
      end
    end
  end
end
  
