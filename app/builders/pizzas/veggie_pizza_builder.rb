class Pizzas::VeggiePizzaBuilder < AbstractProductBuilder

    LABEL_TYPE = "VeggiePizzaType"
    VALUE_TYPE = "Veggie Pizza"

    # @abstract
    def label_type
        LABEL_TYPE
    end

    # @abstract
    def value_type
        VALUE_TYPE
    end

    def build_product
        @product.name = "Veggie Pizza"
        @product.description = "Veggie pizza Description"

        # BASIC PROPERTIES: 
        add_product_property("Veggie Cheese", "Delicious Veggie Cheese", ProductProperty::CHEESE)
        add_product_property("Veggie Sauce", "Veggie Sauce", ProductProperty::SAUCE)
        add_product_property("Veggie Topping", "Veggie Topping", ProductProperty::TOPPING)
    end
end