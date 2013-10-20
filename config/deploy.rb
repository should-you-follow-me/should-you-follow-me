require 'sidekiq/capistrano'

set :application, 'should you follow me'
set :repo_url, 'git@github.com:railsrumble/r13-team-518.git'

set :deploy_to, '/www/shouldyoufollowme'

SSHKit.config.command_map[:sidekiq] = "bundle exec sidekiq"
SSHKit.config.command_map[:sidekiqctl] = "bundle exec sidekiqctl"

set :sidekiq_cmd,           ->{ :sidekiq }
set :sidekiqctl_cmd,        ->{ :sidekiqctl }

                              # must be relative to Rails.root. If this changes, you'll need to manually
                              # stop the existing sidekiq process.
set :sidekiq_pid,           ->{ "tmp/sidekiq.pid" }

                              # "-d -i INT -P PATH" are added automatically.
set :sidekiq_options,       ->{ "-e #{fetch(:rails_env, 'production')} -L #{current_path}/log/sidekiq.log" }

set :sidekiq_timeout,       ->{ 10 }
set :sidekiq_role,          ->{ :app }
set :sidekiq_processes,     ->{ 1 }

namespace :deploy do
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :finishing, 'deploy:cleanup'
end
