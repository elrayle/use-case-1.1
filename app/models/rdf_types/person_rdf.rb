module RdfTypes
  class PersonRdf < ActiveTriples::Resource
    configure :type => FOAF.Person, :base_uri => 'http://vivo.cornell.edu/individual/'
  end
end
