class Api::V1::OrdersController < ApplicationController

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
    
end
