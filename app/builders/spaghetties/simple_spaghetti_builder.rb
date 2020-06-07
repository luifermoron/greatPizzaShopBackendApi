class Spaghetties::SimpleSpaghettiBuilder < AbstractProductBuilder

    LABEL_TYPE = "SimpleSpaghettiType"
    VALUE_TYPE = "Spaghetti"

    # @abstract
    def label_type
        LABEL_TYPE
    end

    # @abstract
    def value_type
        VALUE_TYPE
    end

    def build_product
        @product.name = "Spaghetti"
        @product.description = "Spaghetti Description"
    end
end