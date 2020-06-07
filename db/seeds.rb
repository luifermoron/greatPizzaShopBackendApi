p '1 Creating Categories'
pizza_category = Category.find_or_create_by({name: 'Pizzas', description: 'A great description for Pizzas' })
spaghetti_category = Category.find_or_create_by({ name: 'Spaghetties',  description: 'A great description for Spaghetties' })
lasagna_category = Category.find_or_create_by({ name: 'Lasagnas',  description: 'A great  description for Lasagnas' })
salads_category = Category.find_or_create_by({ name: 'Salads',  description: 'A great  description for Salads' })
top_category = Category.find_or_create_by({ name: 'Top Products',  description: 'A great  description for Top Products' })
p '1 Created Categories'



p '2 Create Products'
p '2 Creating Products'
# Personal Hawaiian Pizza
hawaiian_pizza_builder = Pizzas::HawaiianPizzaBuilder.new
hawaiian_pizza_builder.add_category(pizza_category)
hawaiian_pizza_builder.add_product_property("Personal", "2", ProductProperty::SIZE)
hawaiian_pizza_builder.build
# Medium Hawaiian Pizza
hawaiian_pizza_builder.product
hawaiian_pizza_builder.add_product_property("Medium", "4", ProductProperty::SIZE)
hawaiian_pizza_builder.add_category(pizza_category)
hawaiian_pizza_builder.build
# Personal Brazilian Pizza
brazilian_pizza_builder = Pizzas::BrazilianPizzaBuilder.new
brazilian_pizza_builder.add_category(pizza_category)
brazilian_pizza_builder.add_category(top_category)
brazilian_pizza_builder.add_product_property("Personal", "2", ProductProperty::SIZE)
brazilian_pizza_builder.build
# Personal Veggie Pizza
veggie_pizza_builder = Pizzas::VeggiePizzaBuilder.new
veggie_pizza_builder.add_category(pizza_category)
veggie_pizza_builder.add_product_property("Random Topping", "Veggie Topping", ProductProperty::TOPPING)
veggie_pizza_builder.add_product_property("Large", "8", ProductProperty::SIZE)
veggie_pizza_builder.build


# Spaghetties
simple_spaghetties = Spaghetties::SimpleSpaghettiBuilder.new
simple_spaghetties.add_category(spaghetti_category)
simple_spaghetties.add_category(top_category)
simple_spaghetties.build

# Lasagnas
# TO-DO
# Salads
# TO-DO
# Add/Remove your dessired product
p '2 Created Products'