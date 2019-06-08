lock '3.6.0'

# デプロイするアプリケーション名
set :application, 'i_know_that'

# cloneするgitのレポジトリ（xxxxxxxx：ユーザ名、yyyyyyyy：アプリケーション名）
set :repo_url, 'https://github.com/sacrament8/i_know_that'

# deployするブランチ。デフォルトはmasterなのでなくても可。
set :branch, "carrier-ver" || 'master'

# deploy先のディレクトリ。
set :deploy_to, '/var/www/i_know_that'

# シンボリックリンクをはるフォルダ・ファイル
set :linked_files, %w{.env config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/uploads}

# 保持するバージョンの個数(※後述)
set :keep_releases, 5

# Rubyのバージョン
set :rbenv_ruby, '2.5.3'
set :rbenv_type, :system

# yarnの設定
# set :yarn_flags, "--prefer-offline --production --no-progress"
# set :yarn_roles, :app
# set :yarn_bin, '/usr/local/rbenv/shims'

#出力するログのレベル。エラーログを詳細に見たい場合は :debug に設定する。
#本番環境用のものであれば、 :info程度が普通。ただし挙動をしっかり確認したいのであれば :debug に設定する。
set :log_level, :info

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end

  # before :publishing, 'db:seed_fu'
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