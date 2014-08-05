module RdfTypes
  class VirtualCollectionRdf < ActiveTriples::Resource
    configure :type => LD4L.VirtualCollection, :base_uri => 'http://localhost:3000/vc'

    # extended properties from LD4L.VirtualCollection
    property :title,       :predicate => RDFS.label
    property :description, :predicate => RDFS.comment
    property :owner,       :predicate => RDF::DC.creator

    # properties from CO.List
    # configure :type => CO.List, :base_uri => 'http://purl.org/co'   # LD4L.VirtualCollection is a subclass of CO.List
    property :size,        :predicate => CO.size
    property :firstItem,   :predicate => CO.firstitem
    property :item,        :predicate => CO.item               # TODO: how to make multiple???
    property :lastItem,    :predicate => CO.lastitem
  end
end
