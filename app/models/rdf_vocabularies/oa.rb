module RdfVocabularies
  class OA < RDF::Vocabulary("http://www.w3.org/ns/oa#")

    # Class definitions
    term :Annotation
    term :Motivation
    term :Tag
    term :SemanticTag

    # Property definitions
    property :hasBody
    property :hasTarget
    property :motivatedBy  # relationship for motivation
    property :commenting   # an instance for OA:Motivation  (ex. <anAnnotationURI> <ao:motivatedBy> <oa:commenting>)
    property :tagging      # an instance for OA:Motivation  (ex. <anAnnotationURI> <ao:motivatedBy> <oa:tagging>)
  end
end
