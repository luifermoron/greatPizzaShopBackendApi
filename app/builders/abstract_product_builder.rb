class AbstractProductBuilder
  
    def initialize
      reset
    end

    def reset 
      @product = Product.new
    end

    def product
      product = @product
      reset
      product
    end

    private def build_product_type
      ProductType.find_or_initialize_by({ label: label_type,  value: value_type})
    end

    def build
      ActiveRecord::Base.transaction do
        product_type = build_product_type
        build_product() 
        product_type.save
        @product.product_type = product_type
        @product.save
        @product
      end
    end
    
    # @abstract
    def add_product_property(label, value, type_property)
      @product.product_properties << ProductProperty.new({ label: label,  value: value, type_property: type_property})
    end

    # @abstract
    def add_category(category)
      @product.categories << category
    end

    protected def build_product
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    # @abstract
    def label_type
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    # @abstract
    def value_type
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
end