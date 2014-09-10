module RDFTypes
  class SemanticTagAnnotationRDF < RDFTypes::OpenAnnotationRDF
    @id_prefix="stg"

    configure :type => RDFVocabularies::OA.SemanticTag, :base_uri => Rails.configuration.urigenerator.base_uri, :repository => :default

    # def initialize
    #   self.motivated_by = RDFVocabularies::OA.tagging  # TODO How to set a default value for motivated_by?
    # end
  end

end


