module RDFTypes
  class OpenAnnotationRDF < RDFTypes::ResourceExtension

    @id_prefix="oa"

    configure :type => RDFVocabularies::OA.Annotation, :base_uri => "http://localhost:3000/individual/"

    property :hasTarget,   :predicate => RDFVocabularies::OA.hasTarget    # :type => URI
    property :hasBody,     :predicate => RDFVocabularies::OA.hasBody      # :type => URI
    property :motivatedBy, :predicate => RDFVocabularies::OA.motivatedBy  # :type => URI
  end
end

