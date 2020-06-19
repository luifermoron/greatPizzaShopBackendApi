class UserCustomProductBuilder < AbstractProductBuilder

    attr_writer :label_type, :value_type


    def dup(product)
        @product = product.dup
        @product.created_by_user = true
        @product.categories= product.categories
        @product.product_type = product.product_type
        @product.product_properties = product.product_properties
    end

    def label_type
        return @label_type
    end

    def value_type
        return @value_type
    end
    
    def add_product_property(product_property)
        @product.product_properties << product_property
    end

    def build_product
        # no needed
    end
  end