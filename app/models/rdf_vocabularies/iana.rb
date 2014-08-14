module RdfVocabularies
  class IANA < RDF::Vocabulary("http://www.iana.org/assignments/relation/")
    property :next        # URI of next item
  end
end
