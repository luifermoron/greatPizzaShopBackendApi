# Great Pizza Backend
# Table of Contents
1. Assumption
2. Installation
3. State Order Process: how it works
4. Add new type of products or categories

## Assumption
-   Ingredients, size, etc can be see as properties from products.
-   Because no specified, Orders are always delivered as a final state.
-   Order process is a simulation.
-   New Categories and products can only be created by admins(from seeders now, but in future a admin panel side can be implemented). In the other hand, products can be customizes by clients. For example: A client can ask for small size without cheese of Hawaiian pizza, but he/she cannot create a new kind of pizza or he/she cannot create a new category or even link the pizza to some category.

## Installation
```
bundle install
rails db:create
rails db:migrate
rails db:seed
rails s -p 8000
```
## State Order Process: how it works
Lets suppose a client ask for the next order:
| Product         | Properties                       | Quantity |
|-----------------|----------------------------------|----------|
| Hawaiian Pizza  | Small size, thin crust, 'llajua' | 4        |
| Brazilian Pizza | Big size, cheese, some random topping | 3        |
| Salads          | Medium size                         | 5        |
Everytime the client asks for the state of its order, the order has the next behavior:
    1) The 4 Hawaiian pizzas are prepared, baked, cutted, boxed everytime the client asks for his order. When 4 hawaiian pizzas are boxed, they wait for the next products.
    2) The first process is repeated until all products are boxed.
    3) When all products are boxed, they change to: Delivering state.
    4) Finally, all products are with client, the products change to: Delivered state.
## Architecture
It uses the default MVC of RubyOnRails plus repository pattern.
Because of Great Pizza sells differents products that can be highly customized from different circustances, the made decision was to implement generic models.

Please Check out docs/erd.pdf and docs/stateOrder.png respectly.

The models are described as follow:
-   Category: Generic model for categories. It has name and description attributes. A category can have multiple products from different type of products.
-   Product: Generic model for products. It has name, description,created_by_user(used for filtering) attributes. Anyother attribute can be linked via ProductProperty relationship. Belongs to a ProductType. A Product can be in multiple categories as admin demans. 
-   ProductType: Generic model for product types from products. This model is responsable for clasify products. its Fields are:
    -   label: type value itself,
    -   value: for user visualization.
-   ProductProperty: Custom product property from products. 
    -   type_property: A product can have: Cheese, Size, Sauce, Topping. 
    -   label: type value itself.For example, if type_property is equal to size, label can be: Personal, Small, Medium, and Large.
    -   value: used for extra information.
-   Category: Generic model for categories. It has name and description attributes. A category can have multiple products from different type of products.
-   Order: Used to store the order information from a client. It can have: description and client address for delivery if required.
-   StateOrder: Model for tracking state order and it times.
-   ProductOrder: Model for saving product and its quantities.


In addition, Builder design pattern was used to give the ability of high customization. A product can be built with whatever property.


## Add new type of products or categories
Ideally a admin side panel should be implemented for easy administration. For now, seeders are the only way to do that.

#### Adding new Category:
```
category_repository = CategoryRepository
pizza_category = category_repository.find_or_create_by({name: 'Pizzas', description: 'A great description for Pizzas' })
```
#### Adding new Type of products:

Everytime you want to add a product with all its custom information you only have to implement three methods: label_type, value_type, build_product [(Sample)](https://github.com/luifermoron/greatPizzaShopBackendApi/blob/master/app/builders/spaghetties/simple_spaghetti_builder.rb)

```
hawaiian_pizza_builder = Pizzas::HawaiianPizzaBuilder.new
hawaiian_pizza_builder.add_category(pizza_category)
hawaiian_pizza_builder.add_product_property("Personal", "2 Slices", ProductProperty::SIZE)
hawaiian_pizza_builder.build
```
Everytime you want to edit a product with all its custom information, you can edit its builder methods: label_type, value_type, build_product or edit on seeders [(Sample)](https://github.com/luifermoron/greatPizzaShopBackendApi/blob/master/db/seeds.rb).
