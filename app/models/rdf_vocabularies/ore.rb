module RdfVocabularies
  class ORE < RDF::Vocabulary("http://www.openarchives.org/ore/terms/")

    # Class definitions
    term :Aggregation
    term :Proxy

    # Property definitions ORE.Aggregation
    property :aggregates        # URI of each list item in this Aggregation -- TODO: How to have multiple items?

    # Property definitions for ORE.Proxy
    property :proxyFor          # URI of list item
    property :proxyIn           # URI of aggregating list
  end
end
