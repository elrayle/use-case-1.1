module RdfTypes
  class OpenAnnotationBodyRDF < ActiveTriples::Resource

    ID_PREFIX = 'oab'

    configure :base_uri => "http://localhost:3000/annotations/bodies"

    property :type, :predicate => RDF::type, :type => URI      # TODO: How to have multiple types?
    property :content, :predicate => RdfVocabularies::CNT.chars, :type => XSD.string
    property :format,  :predicate => RDF::DC.format, :type => XSD.string
  end
end
