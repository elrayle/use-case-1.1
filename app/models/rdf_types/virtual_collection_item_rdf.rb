module RDFTypes
  class VirtualCollectionItemRDF < RDFTypes::ResourceExtension

    @id_prefix="vci"

    # configure :type => RDFVocabularies::CO.ListItem, :base_uri => Rails.configuration.urigenerator.base_uri, repository => :default
    configure :type => RDFVocabularies::ORE.Proxy, :base_uri => Rails.configuration.urigenerator.base_uri, :repository => :default

    # # properties from CO.ListItem
    # property :index,       :predicate => RDFVocabularies::CO.index
    # property :itemContent, :predicate => RDFVocabularies::CO.itemContent
    # property :nextItem,    :predicate => RDFVocabularies::CO.nextItem,    :class_name => RDFTypes::VirtualCollectionItemRDF

    # properties from ORE.Proxy
    property :proxyFor,         :predicate => RDFVocabularies::ORE.proxyFor
    property :proxyIn,          :predicate => RDFVocabularies::ORE.proxyIn, :class_name => RDFTypes::VirtualCollectionRDF
    property :next,             :predicate => RDFVocabularies::IANA.next,   :class_name => RDFTypes::VirtualCollectionItemRDF
    property :contributor,      :predicate => RDF::DC.contributor,          :class_name => RDFTypes::PersonRDF   # TODO User who added this item to the Virtual Collection (default=Virtual Collection's owner)
  end
end