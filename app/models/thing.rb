class Thing < ActiveTriples::Resource
  configure :type => RDF::OWL.Thing, :base_uri => 'http://example.org/things#'
  property :title, :predicate => RDF::DC.title
  property :description, :predicate => RDF::DC.description
end