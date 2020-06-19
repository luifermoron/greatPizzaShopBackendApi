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

      def find_order_by(*attrs)
        Order.includes(:state_orders, :products).find_by(*attrs)
      end
      
      private def build_custom_product_builder(order, productBuilder)
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
        ActiveRecord::Base.transaction do
          orders = permitted_params[:orders]
          address = permitted_params[:address]
          productBuilder = UserCustomProductBuilder.new
          orderRecord = Order.create({address: address})

          orders.each do |order|
            build_custom_product_builder(order, productBuilder)
            productBuilder.build
            quantity = order[:quantity]
            product = productBuilder.product

            ProductOrder.create({ product: product, order: orderRecord, quantity: quantity })
            StateOrder.create({ product: product, order: orderRecord})
          end
          orderRecord
        end
      end

      private def pre_delivering_order_process(stateOrder)
        case stateOrder.aasm.current_state
        when StateOrder::STATE_UNVERIFIED
          stateOrder.prepare!
        when StateOrder::STATE_PREPARED
          stateOrder.bake!
        when StateOrder::STATE_BAKED
          stateOrder.cut!
        when StateOrder::STATE_CUTTED
          stateOrder.box!
        end
      end

      private def delivering_order_process(current_state, order)
        case current_state
        when StateOrder::STATE_BOXED
          StateOrder.where(order_id: order.id).update_all(state: StateOrder::STATE_DELIVERING)
        when StateOrder::STATE_DELIVERING
          StateOrder.where(order_id: order.id).update_all(state: StateOrder::STATE_DELIVERED)
        end
      end

      def simulate_handle_states_order(id)
        order = find_order_by({id: id})
        stateOrder = order.existsAny?([StateOrder::STATE_UNVERIFIED, StateOrder::STATE_PREPARED, StateOrder::STATE_BAKED, StateOrder::STATE_CUTTED])
        unless stateOrder.nil?
          pre_delivering_order_process(stateOrder)
        else
          stateOrder = order.existsAny?([StateOrder::STATE_BOXED, StateOrder::STATE_DELIVERING])
          unless stateOrder.nil?
            delivering_order_process(stateOrder.aasm.current_state, order)
          end
        end
        sdfa = find_order_by({id: order.id})
        p sdfa
        sdfa
      end

    end
end