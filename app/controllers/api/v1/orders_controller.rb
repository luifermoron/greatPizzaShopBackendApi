class Api::V1::OrdersController < ApplicationController

    before_action :validate_create, only: [:create]

    def create
        permitted_params = order_params
        @order = ProductRepository.create_order(permitted_params)
        render json: @order
    end

    def show
        @order = ProductRepository.simulate_handle_states_order(params[:id])
        render json: @order.as_json(:include => :state_orders)
    end

    private
        def order_params
            params.permit(
                :address,   
                orders: [
                    :quantity,
                    product: {}
                ]
            )
        end
    private
        def validate_create
          order = Api::V1::Validations::Orders.new(params)
          order.validate!
        end
    
end
