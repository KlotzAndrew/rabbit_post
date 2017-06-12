class MmErrorLogger
  def self.log(msg)
    @logger ||= Logger.new("#{Rails.root}/log/mm_error.log")
    @logger.error(msg)
  end
end

MultipleMan.configure do |config|
  # A connection string to your local server. Defaults to localhost.
  config.connection = {
    addresses: ['192.168.99.100:5673', '192.168.99.100:5674', '192.168.99.100:5675'],
    continuation_timeout: 1000
  }
  # The topic name to push to. If you have multiple
  # multiple man apps, this should be unique per application. Publishers
  # and subscribers should always use the same topic.
  config.topic_name = 'rabbit_topic'

  # The application name (used for subscribers) - defaults to your
  # Rails application name if you're using rails
  config.app_name = 'RabbitPost'

  # Specify what should happen when MultipleMan
  # encounters an exception.

  config.on_error do |exception|
    MmErrorLogger.log(exception)
  end

  # Add opts that go directly to the bunny constructor (Advanced)
  # config.bunny_opts = {
  #   tls_ca_certificates: ['/usr/lib/ssl/certs/cacert.pem']
  # }

  # Add opts that are used when creating the exchange
  config.exchange_opts = {
    durable: true
  }

  config.publisher_confirms = true

  # Where you want to log errors to. Should be an instance of Logger
  # Defaults to the Rails logger (for Rails) or STDOUT otherwise.
  config.logger = Logger.new("#{Rails.root}/log/mm.log")
end
