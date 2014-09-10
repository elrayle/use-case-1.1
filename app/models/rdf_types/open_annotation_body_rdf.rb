module RDFTypes
  class OpenAnnotationBodyRDF < RDFTypes::ResourceExtension

    @id_prefix="oab"

    configure :base_uri => Rails.configuration.urigenerator.base_uri, :repository => :default

    property :type,    :predicate => RDF::type                   # :type => URI      # TODO: How to have multiple types?
    property :content, :predicate => RDFVocabularies::CNT.chars  # :type => XSD.string
    property :format,  :predicate => RDF::DC.format              # :type => XSD.string
  end
end
