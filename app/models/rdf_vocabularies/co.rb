module RdfVocabularies
  class CO < RDF::Vocabulary("http://purl.org/co#")

    # Class definitions
    term :List
    term :ListItem

    # Property definitions for CO.List
    property :size           # xsd:nonNegativeInteger -- count of all ListItems in this List
    property :firstItem      # URI to first ListItem
    property :lastItem       # URI to last ListItem
    property :item           # URI of each ListItem in this List -- TODO: How to have multiple items?

    # Property definitions for CO.ListItem
    property :index          # xsd:positiveInteger -- index of each ListItem starting at 1 counting up
    property :itemContent    # URI to any content
    property :nextItem       # URI to a ListItem   -- TODO: Can this default to nil?  =nil when only one item AND for last item
  end
end
