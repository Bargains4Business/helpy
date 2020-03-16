# config/initializers/sidekiq.rb
Sidekiq::Extensions.enable_delay!

redis_url = "redis://#{REDIS_SETTINGS['host']}:#{REDIS_SETTINGS['port']}/#{REDIS_SETTINGS['sidekiq_db']}"

# To clean up lingering sidekiq processes, modify this as necessary to connect to your Redis.
# After 60 seconds, lingering processes should disappear from the Busy page.

REDIS_POOL.with do |redis|
  redis.smembers("processes").each do |pro|
    redis.expire(pro, 60)
    redis.expire("#{pro}:workers", 60)
  end
end

Sidekiq.configure_server do |config|
  config.redis = { :url => redis_url }
  config.on(:startup) do
    ISO3166::Data.load_data! if defined?(ISO3166)
  end
end

Sidekiq.configure_client do |config|
  config.redis = { :url => redis_url }
end
