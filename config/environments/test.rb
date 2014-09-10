Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # The test environment is used exclusively to run your application's
  # test suite. You never need to work with it otherwise. Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs. Don't rely on the data there!
  config.cache_classes = true

  # Do not eager load code on boot. This avoids loading your whole application
  # just for the purpose of running a single test. If you are using a tool that
  # preloads Rails for running tests, you may have to set it to true.
  config.eager_load = false

  # Configure static asset server for tests with Cache-Control for performance.
  config.serve_static_assets  = true
  config.static_cache_control = 'public, max-age=3600'

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment.
  config.action_controller.allow_forgery_protection = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Print deprecation notices to the stderr.
  config.active_support.deprecation = :stderr

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # -----------------------------------------
  #  Custom configurations for this app
  # -----------------------------------------
  # rails app configuration
  config.appconfig = ActiveSupport::OrderedOptions.new
  # config.appconfig.wifi_available  = true   # TODO REMOVE THIS LINE
  config.appconfig.webapp_base_uri = 'http://localhost:3000'

  # triplestore configuration
  config.triplestore = ActiveSupport::OrderedOptions.new
  config.triplestore.default_repository = 'sqlite3:db/triples.sqlite'
  config.triplestore.person_repository  = 'sqlite3:db/person_triples.sqlite'

  # URI generation configuration
  config.urigenerator = ActiveSupport::OrderedOptions.new
  config.urigenerator.base_uri     = 'http://localhost:3000'
  config.urigenerator.bibliographic_base_uri = 'http://da-rdf.library.cornell.edu/individual'
  config.urigenerator.person_base_uri        = 'http://vivo.cornell.edu/individual'

  # controlled vocabularies configuration
  # TODO Add these to add controlled vocabularies for semantic tag annotations
  # config.authority = ActiveSupport::OrderedOptions.new
  # config.authority.discipline_base_uri       = "#{Rails.configuration.appconfig.webapp_base_uri}/authorities/local/discipline"
  # config.authority.subdiscipline_partial_uri = 'subdiscipline'
  # config.authority.subresource_type_base_uri = "#{Rails.configuration.appconfig.webapp_base_uri}/authorities/local/subresource_type"

end
