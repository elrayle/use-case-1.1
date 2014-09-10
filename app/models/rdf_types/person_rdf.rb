module RDFTypes
  class PersonRDF < RDFTypes::ResourceExtension

    @id_prefix="p"

    configure :type => RDF::FOAF.Person, :base_uri => Rails.configuration.urigenerator.person_base_uri, :repository => :default
  end
end
