module RdfTypes
  class VirtualCollectionItemRdf < ActiveTriples::Resource

    ID_PREFIX = 'vci'

    # configure :type => CO.ListItem, :base_uri => 'http://localhost:3000'
    configure :type => ORE.Proxy, :base_uri => 'http://localhost:3000'

    # # properties from CO.ListItem
    # property :index,       :predicate => CO.index
    # property :itemContent, :predicate => CO.itemContent
    # property :nextItem,    :predicate => CO.nextItem          # TODO: can we set a default value of nil?

    # properties from ORE.Proxy
    property :proxyFor,         :predicate => ORE.proxyFor
    property :proxyIn,           :predicate => ORE.proxyIn
    property :next,                :predicate => IANA.next
    property :contributor,      :predicate => DC.contributor
  end
end