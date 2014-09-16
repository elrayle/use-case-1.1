Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  # config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

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
  # config.triplestore.person_repository  = 'sqlite3:db/person_triples.sqlite'   # example of using multiple triplestores

  # URI generation configuration
  config.urigenerator = ActiveSupport::OrderedOptions.new
  config.urigenerator.base_uri               = 'http://localhost:3000'
  config.urigenerator.bibliographic_base_uri = 'http://da-rdf.library.cornell.edu/individual'
  config.urigenerator.person_base_uri        = 'http://vivo.cornell.edu/individual'

  # controlled vocabularies configuration
  # TODO Add these to add controlled vocabularies for semantic tag annotations
  # config.authority = ActiveSupport::OrderedOptions.new
  # config.authority.discipline_base_uri       = "#{Rails.configuration.appconfig.webapp_base_uri}/authorities/local/discipline"
  # config.authority.subdiscipline_partial_uri = 'subdiscipline'
  # config.authority.subresource_type_base_uri = "#{Rails.configuration.appconfig.webapp_base_uri}/authorities/local/subresource_type"

end
