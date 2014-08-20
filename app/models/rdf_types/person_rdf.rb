module RDFTypes
  class PersonRDF < RDFTypes::ResourceExtension

    @id_prefix="p"

    configure :type => RDF::FOAF.Person, :base_uri => 'http://vivo.cornell.edu/individual/'
  end
end
