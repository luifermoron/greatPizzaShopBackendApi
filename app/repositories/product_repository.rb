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

      def find(id)
        Product.find(id)
      end
    end
end