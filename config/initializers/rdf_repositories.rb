def configure_repositories
  ActiveTriples::Repositories.clear_repositories!
  if Rails.env.development?
    puts "*****************************************************************"
    puts "   DEV ENV: Creating rdf-do :default ActiveTriples Repository -- #{Rails.configuration.triplestore.default_repository}"
    puts "*****************************************************************"
    ActiveTriples::Repositories.add_repository :default, RDF::DataObjects::Repository.new(Rails.configuration.triplestore.default_repository)
    puts "***  After add_repository ***"
  elsif Rails.env.test?
    puts "********************************************************************"
    puts "   TEST ENV: Creating in-memory :default ActiveTriples Repository"
    puts "********************************************************************"
    ActiveTriples::Repositories.add_repository :default, RDF::Repository.new
    puts "***  After add_repository ***"
  else
    puts "********************************************************************"
    puts "   PROD ENV: Creating #### TBA #### :default ActiveTriples Repository"
    puts "********************************************************************"
    # TODO Production TripleStore TBD -- Need to update once this is properly configured in config/environments/production.rb
    ActiveTriples::Repositories.add_repository :default, RDF::DataObjects::Repository.new(Rails.configuration.triplestore.default_repository)
    puts "***  After add_repository ***"
  end
end
puts "************************************************"
puts "   Running configure_repositories initializer"
puts "************************************************"
# Not sure why configure_repositories is called twice in this way.  Code modified from Oregon Digital project.
configure_repositories
Rails.application.config.to_prepare do
  configure_repositories
end
puts "***  After configure_repository ***"
