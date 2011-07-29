module SimpleShow
  class Base
    def initialize(binding, record, options = {})
      @binding = binding
      @record  = record
      @options = options
    end

    def show(attr, options = {})
      output = label(attr, options)
      output += value(attr, options)
      if SimpleShow.wrapper_tag.nil?
        output
      else
        @binding.content_tag(SimpleShow.wrapper_tag, output, :class => SimpleShow.wrapper_class)
      end
    end

    def label(attr, options = {})
      @binding.content_tag(SimpleShow.label_tag, :class => SimpleShow.label_class) do
        [SimpleShow.label_prefix, options[:label] || @record.class.human_attribute_name(attr), SimpleShow.label_suffix].compact.join
      end
    end

    def value(attr, options = {})
      @binding.content_tag(SimpleShow.value_tag, :class => SimpleShow.value_class) do
        [SimpleShow.value_prefix, @record.send(attr), SimpleShow.value_suffix].compact.join
      end
    end
  end
end
