module RDFTypes
  class VirtualCollectionRDF < RDFTypes::ResourceExtension

    @id_prefix="vc"

    # configure :type => RdfVocabularies::CO.List, :base_uri => 'http://localhost:3000'
    configure :type => RDFVocabularies::ORE.Aggregation, :base_uri => 'http://localhost:3000/individual/'

    # extended properties for LD4L implementation
    property :title,       :predicate => RDF::DC.title
    property :description, :predicate => RDF::DC.description
    property :owner,       :predicate => RDFVocabularies::DCTERMS.creator

    # # properties from CO.List
    # property :size,        :predicate => RdfVocabularies::CO.size
    # property :firstItem,   :predicate => RdfVocabularies::CO.firstitem
    # property :item,        :predicate => RdfVocabularies::CO.item               # TODO: how to make multiple???
    # property :lastItem,    :predicate => RdfVocabularies::CO.lastitem

    # properties from ORE.Aggregation
#    property :aggregates,   :predicate => RdfVocabularies::ORE.aggregates,   :type => URI        # TODO: how to make multiple???
    property :aggregates,   :predicate => RDFVocabularies::ORE.aggregates        # TODO: how to make multiple???

    def test_get_uri
      test_uri = get_uri('987')
      test_uri = self::get_uri('876')
      puts test_uri
    end
  end
end


