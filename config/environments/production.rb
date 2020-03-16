Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Enable Rack::Cache to put a simple HTTP cache in front of your application
  # Add `rack-cache` to your Gemfile before enabling this.
  # For large-scale production use, consider using a caching reverse proxy like
  # NGINX, varnish or squid.
  # config.action_dispatch.rack_cache = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.serve_static_files = !!ENV['RAILS_SERVE_STATIC_FILES'].presence

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :scss

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  config.force_ssl = !!ENV['RAILS_FORCE_SSL'].presence

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :info

  # Prepend all log lines with the following tags.
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups.
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = 'http://assets.example.com'

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options = { host: Settings.site_url }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = Settings.send_email

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  # This can be managed through the settings panel inside Helpy.  It is probably best you leave
  # all locales enabled.  If you write a new locale, you need to add it here!
  config.i18n.available_locales = [:en, :es, :de, :fr, :it, :et, :ca, :sv, :hu, :ru, :ja, :hi, 'zh-cn', 'zh-tw', 'pt', :nl, 'tr', 'pt-br', :fa, :fi, :id, :ar, :ko, :ms, :uk]
  config.i18n.default_locale = :en
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  config.active_job.queue_adapter = :sidekiq

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # To get real request_ip behind cloudflare
  config.action_dispatch.trusted_proxies = %r{
    ^192\.168\.                                           | # Cloudflare 192.168.0.0,16 range 192.168.0.0 .. 192.168.255.255
    ^103\.21\.24[4-7]\.                                   | # Cloudflare 103.21.244.0,22 range 103.21.244.0 .. 103.21.247.255
    ^103\.22\.20[0-3]\.                                   | # Cloudflare 103.22.200.0,22 range 103.22.200.0 .. 103.22.203.255
    ^103\.31\.[4-7]\.                                     | # Cloudflare 103.31.4.0,22 range 103.31.4.0 .. 103.31.7.255
    ^104\.(1[6-9]|2[0-9]|3[0-1])\.                        | # Cloudflare 104.16.0.0,12
    ^108\.162\.(19[2-9]|2[0-4][0-9]|25[0-5])\.            | # Cloudflare 108.162.192.0,18
    ^141\.101\.(6[4-9]|[7-9][0-9]|1[0-1][0-9]|12[0-7])\.  | # Cloudflare 141.101.64.0,18
    ^162\.15[8-9]\.                                       | # Cloudflare 162.158.0.0,15
    ^172\.(6[4-9]|7[0-1])\.                               | # Cloudflare 172.64.0.0,13
    ^173\.245.(4[8-9]|6[0-3])\.                           | # Cloudflare 173.245.48.0,20
    ^188\.114\.(9[6-9]|10[0-9]|11[0-1])\.                 | # Cloudflare 188.114.96.0,20
    ^190\.93\.2(4[0-9]|5[0-5])\.                          | # Cloudflare 190.93.240.0,20
    ^197\.234\.24[0-3]\.                                  | # Cloudflare 197.234.240.0,22 range 197.234.240.0 .. 197.234.243.255
    ^198\.41\.(12[8-9]|1[3-9][0-9]|2[0-4][0-9]|25[0-5])\. | # Cloudflare 198.41.128.0,17 range 198.41.128.0 .. 198.41.255.255
    ^2400:cb00:                                           | # Cloudflare IPv6 2400,cb00,,32
    ^2405:8100:                                           | # Cloudflare IPv6 2405,8100,,32
    ^2405:b500:                                           | # Cloudflare IPv6 2405,b500,,32
    ^2606:4700:                                           | # Cloudflare IPv6 2606,4700,,32
    ^2803:f800:                                           | # Cloudflare IPv6 2803,cf800,,32
    ^127\.0\.0\.1$                                        | # localhost IPv4
    ^::1$                                                 | # localhost IPv6
    ^fc00:                                                | # private IPv6 range fc00
    ^10\.                                                 | # private IPv4 range 10.x.x.x
    ^172\.(1[6-9]|2[0-9]|3[0-1])\.                          # private IPv4 range 172.16.0.0 .. 172.31.255.255
  }x
end
