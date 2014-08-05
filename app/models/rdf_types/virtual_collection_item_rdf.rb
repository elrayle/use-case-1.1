module RdfTypes
  class VirtualCollectionItemRdf < ActiveTriples::Resource
    configure :type => CO.ListItem, :base_uri => 'http://localhost:3000/vci'

    property :index,       :predicate => CO.index
    property :itemContent, :predicate => CO.itemcontent
    property :nextItem,    :predicate => CO.nextitem          # TODO: can we set a default value of nil?
  end
end