class Pizzas::BrazilianPizzaBuilder < AbstractProductBuilder

    LABEL_TYPE = "BrazilianPizzaType"
    VALUE_TYPE = "Brazilian Pizza"

    # @abstract
    def label_type
        LABEL_TYPE
    end

    # @abstract
    def value_type
        VALUE_TYPE
    end

    def build_product
        @product.name = "Brazilian Pizza"
        @product.description = "Brazilian pizza Description"

        # BASIC PROPERTIES: 
        add_product_property("Brazilian Cheese", "Delicious Brazilian Cheese", ProductProperty::CHEESE)
        add_product_property("Brazilian Sauce", "Brazilian Sauce", ProductProperty::SAUCE)
        add_product_property("Brazilian Topping", "Brazilian Topping", ProductProperty::TOPPING)
    end
  end