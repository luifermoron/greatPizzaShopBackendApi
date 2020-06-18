class ProductRepository
    class << self
      def all_products()
        products = Product.where(created_by_user: false).includes(:categories, :product_properties, :product_type)
        products_with_associations = products.map do |product| 
        product.attributes.merge(
          'categories' => product.categories,
          'product_properties' => product.product_properties,
          'product_type' => product.product_type,
        )
        end
      end

      def all_product_properties()
        ProductProperty.all
      end

      def find_or_initialize_product_type_by(*attrs)
        ProductType.find_or_initialize_by(*attrs)
      end

      def find_product_type_by(*attrs)
        ProductType.find_by(*attrs)
      end

      def find_product_property_by(*attrs)
        ProductProperty.find_by(*attrs)
      end

      def find(id)
        Product.find(id)
      end

      def find_product_by(*attrs)
        Product.includes(:categories, :product_properties, :product_type).find_by(*attrs)
      end
      
      private build_custom_product_builder(order, productBuilder)
        productParams = order[:product]
        producTypeParams = productParams[:product_type]
        productPropertiesParams = productParams[:properties]

        productType = find_product_type_by({ id: producTypeParams[:id]})

        productBuilder.label_type = productType.label
        productBuilder.value_type = productType.value
        productBuilder.dup(find_product_by({created_by_user: false, product_type_id: productType.id}))

        
        productPropertiesParams.each do |productPropertyParam|
          productProperty = find_product_property_by({id: productPropertyParam[:id]})
          productBuilder.add_product_property(productProperty)
        end
      end
      
      def create_order(permitted_params)
        orders = permitted_params[:orders]
        address = permitted_params[:address]
        productBuilder = UserCustomProductBuilder.new

        ActiveRecord::Base.transaction do
          orders.each do |order|
            build_custom_product_builder(order, productBuilder)
            ##productBuilder.build
          end
        end
      end
      
    end
end