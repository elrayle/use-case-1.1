module RdfTypes
  # module RdfBaseURI
  class RdfBaseURI < ActiveTriples::Resource

    class << self
      attr_accessor :id_prefix
    end
    @id_prefix="s"

    def id_prefix
      if(defined? self.class.id_prefix)
        prefix = self.class.id_prefix.nil?  ? RdfTypes::RdfBaseURI.id_prefix : self.class.id_prefix
      end
      prefix
    end

    def get_uri(uri_or_str)
      return uri_or_str.to_uri if uri_or_str.respond_to? :to_uri
      return uri_or_str if uri_or_str.kind_of? RDF::Node
      uri_or_str = uri_or_str.to_s
      return RDF::Node(uri_or_str[2..-1]) if uri_or_str.start_with? '_:'
      return RDF::URI(uri_or_str) if RDF::URI(uri_or_str).valid? and (URI.scheme_list.include?(RDF::URI.new(uri_or_str).scheme.upcase) or RDF::URI.new(uri_or_str).scheme == 'info')
      return RDF::URI(self.base_uri.to_s + (self.base_uri.to_s[-1,1] =~ /(\/|#)/ ? '' : '/') + id_prefix + uri_or_str) if base_uri && !uri_or_str.start_with?(base_uri.to_s)
      raise RuntimeError, "could not make a valid RDF::URI from #{uri_or_str}"
    end

  end
end

