set :user, "ubuntu"
set :deploy_to, "/home/ubuntu/staging/rosvybory"

server 'y.rosvybory.org', :app, :web, :db, :primary => true

set :rails_env, 'staging'
set :branch, 'develop'

namespace :deploy do
  task :start do
    run "sudo /etc/init.d/unicorn_init start rosvybory_staging"
    run "sudo start rosvybory"
  end

  task :stop do
    run "sudo /etc/init.d/unicorn_init stop rosvybory_staging"
    run "sudo stop rosvybory"
    run "sudo kill `ps aux | grep [r]esque | grep -v grep | cut -c 10-16`"
  end

  task :restart do
    run "sudo /etc/init.d/unicorn_init stop rosvybory_staging"
    run "sudo /etc/init.d/unicorn_init start rosvybory_staging"
    run "sudo stop rosvybory"
    run "sudo kill `ps aux | grep [r]esque | grep -v grep | cut -c 10-16`"
    run "sudo start rosvybory"
  end
end
