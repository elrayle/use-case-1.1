module RdfTypes
  class OpenAnnotationRDF < ActiveTriples::Resource

    ID_PREFIX = 'oa'

    configure :type => OA.Annotation, :base_uri => "http://localhost:3000/annotations"

    property :hasTarget, :predicate => RdfVocabularies::OA.hasTarget, :type => URI
    property :hasBody, :predicate => RdfVocabularies::OA.hasBody, :type => URI
    property :motivatedBy, :predicate => RdfVocabularies::OA.motivatedBy, :type => URI
  end
end

