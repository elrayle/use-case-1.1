# require 'rdf'
# require 'active_triples/version'

module RDFTypes
  autoload :ResourceExtension,          'rdf_types/resource_extension'
  autoload :OpenAnnotationBody,         'rdf_types/open_annotation_body_rdf'
  autoload :OpenAnnotation,             'rdf_types/open_annotation_rdf'
  autoload :TagAnnotation,              'rdf_types/tag_annotation_rdf'
  autoload :SemanticTagAnnotation,      'rdf_types/semantic_tag_annotation_rdf'
  autoload :CommentAnnotation,          'rdf_types/comment_annotation_rdf'
  autoload :Person,                     'rdf_types/person_rdf'
  # autoload :BibliographicReference,     'rdf_types/bibliographic_reference_rdf'   # TODO should there be a model class for bibliographic references to hold info in-memory that is never persisted?
  autoload :VirtualCollectionItem,      'rdf_types/virtual_collection_item_rdf'
  autoload :VirtualCollection,          'rdf_types/virtual_collection_rdf'

  def self.class_from_string(class_name, container_class=Kernel)
    container_class = container_class.name if container_class.is_a? Module
    container_parts = container_class.split('::')
    (container_parts + class_name.split('::')).flatten.inject(Kernel) do |mod, class_name|
      if mod == Kernel
        Object.const_get(class_name)
      elsif mod.const_defined? class_name.to_sym
        mod.const_get(class_name)
      else
        container_parts.pop
        class_from_string(class_name, container_parts.join('::'))
      end
    end
  end
end
