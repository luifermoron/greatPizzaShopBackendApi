# Great Pizza Backend
### Assumption
-   Ingredients, size, etc can be see as properties from products.
-   Because no specified, Orders are always delivered as a final state.
### Architecture
It uses the default MVC of RubyOnRails plus repository pattern.
Because of Great Pizza sells differents products that can be highly customized from different circustances, the made decision was to implement generic models.

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

Everytime you want to add a product with all its custom information you only have to implement three methods: label_type, value_type, build_product [(Sample)](https://github.com/luifermoron/greatPizzaShopBackendApi/blob/master/app/builders/spaghetties/simple_spaghetti_builder.rb)

Everytime you want to edit a product with all its custom information, you can edit its builder methods: label_type, value_type, build_product or edit on seeders [(Sample)](https://github.com/luifermoron/greatPizzaShopBackendApi/blob/master/db/seeds.rb).
### TO - DO:
- Implement state orders
- Implement order process
- Implement more and more test.
- Improve documentation.