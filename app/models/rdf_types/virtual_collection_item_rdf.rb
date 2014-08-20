module RDFTypes
  class VirtualCollectionItemRDF < RDFTypes::ResourceExtension

    @id_prefix="vci"

    # configure :type => RDFVocabularies::CO.ListItem, :base_uri => 'http://localhost:3000'
    configure :type => RDFVocabularies::ORE.Proxy, :base_uri => 'http://localhost:3000/individual/'

    # # properties from CO.ListItem
    # property :index,       :predicate => RDFVocabularies::CO.index
    # property :itemContent, :predicate => RDFVocabularies::CO.itemContent
    # property :nextItem,    :predicate => RDFVocabularies::CO.nextItem          # TODO: can we set a default value of nil?

    # properties from ORE.Proxy
    property :proxyFor,         :predicate => RDFVocabularies::ORE.proxyFor
    property :proxyIn,          :predicate => RDFVocabularies::ORE.proxyIn
    property :next,             :predicate => RDFVocabularies::IANA.next
    property :contributor,      :predicate => RDF::DC.contributor
  end
end