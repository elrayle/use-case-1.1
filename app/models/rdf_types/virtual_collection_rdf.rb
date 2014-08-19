module RdfTypes
  # class VirtualCollectionRdf < ActiveTriples::Resource
  # class VirtualCollectionRdf < RdfTypes::RdfBaseResource
  class VirtualCollectionRdf < RdfTypes::RdfBaseURI

    # extend RdfTypes::RdfBaseURI
    @id_prefix="vc"

    # can't include the /vc as part of the base_uri or the URI gets generated as...
    #    http://localhost:3000/vc/123
    # instead of the desired...
    #    http://localhost:3000/vc123
    # May be able to fix this by overriding the new method?
    # User calls vc = RdfTypes::VirtualCollectionRdf.new('123')
    # And overriding new passes on .new("vc#{id}")  where id='123'   (pseudo code)


    # puts("After local id_prefix method defined -- #{self.id_prefix}")

    # configure :type => RdfVocabularies::CO.List, :base_uri => 'http://localhost:3000'
    configure :type => RdfVocabularies::ORE.Aggregation, :base_uri => 'http://localhost:3000'

    # extended properties for LD4L implementation
    property :title,       :predicate => RDF::DC.title
    property :description, :predicate => RDF::DC.description
    property :owner,       :predicate => RdfVocabularies::DCTERMS.creator

    # # properties from CO.List
    # property :size,        :predicate => RdfVocabularies::CO.size
    # property :firstItem,   :predicate => RdfVocabularies::CO.firstitem
    # property :item,        :predicate => RdfVocabularies::CO.item               # TODO: how to make multiple???
    # property :lastItem,    :predicate => RdfVocabularies::CO.lastitem

    # properties from ORE.Aggregation
#    property :aggregates,   :predicate => RdfVocabularies::ORE.aggregates,   :type => URI        # TODO: how to make multiple???
    property :aggregates,   :predicate => RdfVocabularies::ORE.aggregates        # TODO: how to make multiple???

    def test_get_uri
      test_uri = get_uri('987')
      test_uri = self::get_uri('876')
      puts test_uri
    end
  end
end


