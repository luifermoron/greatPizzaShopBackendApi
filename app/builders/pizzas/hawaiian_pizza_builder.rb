
class Pizzas::HawaiianPizzaBuilder < AbstractProductBuilder

    LABEL_TYPE = "HawaiianPizzaType"
    VALUE_TYPE = "Hawaiian Pizza"

    # @abstract
    def label_type
        LABEL_TYPE
    end

    # @abstract
    def value_type
        VALUE_TYPE
    end

    def build_product
        @product.name = "Hawaiian Pizza"
        @product.description = "Hawaiian pizza Description"

        # BASIC PROPERTIES: 
        add_product_property("Hawaiian Cheese", "Delicious Hawaiian Cheese", ProductProperty::CHEESE)
        add_product_property("Hawaiian Sauce", "Hawaiian Sauce", ProductProperty::SAUCE)
        add_product_property("Hawaiian Topping", "Hawaiian Topping", ProductProperty::TOPPING)
    end
  end
  