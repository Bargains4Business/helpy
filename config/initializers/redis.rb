# config/initializers/redis.rb
require 'connection_pool'

# redis-yml recipe is re-creating the redis.yml on production and staging with the correct urls
REDIS_SETTINGS = Rails.application.config_for :redis

Redis::Client::DEFAULTS[:host] = REDIS_SETTINGS['host']

REDIS_POOL = ConnectionPool.new(size: 10) { Redis.new REDIS_SETTINGS }
