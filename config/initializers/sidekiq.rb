Sidekiq.configure_server do |config|
  config.redis = { :url => 'redis://localhost:6379/12', :namespace => 'yelp_analysis' }
end

Sidekiq.configure_client do |config|
  config.redis = { :url => 'redis://localhost:6379/12', :namespace => 'yelp_analysis' }
end