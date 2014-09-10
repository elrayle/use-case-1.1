module RDFTypes
  class VirtualCollectionRDF < RDFTypes::ResourceExtension

    @id_prefix="vc"

    # configure :type => RdfVocabularies::CO.List, :base_uri => Rails.configuration.urigenerator.base_uri, repository => :default
    configure :type => RDFVocabularies::ORE.Aggregation, :base_uri => Rails.configuration.urigenerator.base_uri, :repository => :default

    # extended properties for LD4L implementation
    property :title,       :predicate => RDF::DC.title
    property :description, :predicate => RDF::DC.description
    property :owner,       :predicate => RDFVocabularies::DCTERMS.creator, :class_name => RDFTypes::PersonRDF

    # # properties from CO.List
    # property :size,        :predicate => RdfVocabularies::CO.size
    # property :firstItem,   :predicate => RdfVocabularies::CO.firstitem, :class_name => RDFTypes::VirtualCollectionItemRDF
    # property :item,        :predicate => RdfVocabularies::CO.item,      :class_name => RDFTypes::VirtualCollectionItemRDF         # multiple values
    # property :lastItem,    :predicate => RdfVocabularies::CO.lastitem,  :class_name => RDFTypes::VirtualCollectionItemRDF

    # properties from ORE.Aggregation
    property :aggregates,   :predicate => RDFVocabularies::ORE.aggregates   # multiple values

  end
end

