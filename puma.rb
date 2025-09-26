# config/puma.rb
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }.to_i
threads min_threads_count, max_threads_count

workers ENV.fetch("WEB_CONCURRENCY") { 2 }

port        ENV.fetch("PORT") { 8080 }
environment ENV.fetch("RAILS_ENV") { "production" }
bind "tcp://0.0.0.0:#{ENV.fetch('PORT', 8080)}"

preload_app!

# Heroku-style reload support; harmless elsewhere
plugin :tmp_restart
