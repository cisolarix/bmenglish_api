#!/usr/bin/env puma
require 'puma'

environment ENV.fetch("RAILS_ENV") { "development" }

daemonize true

# workers ENV.fetch("WEB_CONCURRENCY") { 2 }
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

wd = File.expand_path('../../', __FILE__)
tmp_path = File.join(wd, 'tmp')
log_path = File.join(wd, 'log')
Dir.mkdir(tmp_path) unless File.exist?(tmp_path)

# Store the pid of the server in the file at `path`.
pidfile File.join(tmp_path, 'pids', 'puma.pid')

# Use `path`<9d> as the file to store the server info state. This is
# used by `pumactl` to query and control the server.
state_path File.join(tmp_path, 'sockets', 'puma.state')

# Redirect STDOUT and STDERR to files specified.
stdout_redirect File.join(log_path, 'puma.out.log'), File.join(log_path, 'puma.err.log'), true

# Bind the server.
bind "tcp://0.0.0.0:9292"

preload_app! #utilizing copy-on-write
activate_control_app 'unix:///home/deployer/www/bmenglish/shared/tmp/sockets/pumactl.sock'

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end
