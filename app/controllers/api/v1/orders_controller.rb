class Api::V1::OrdersController < ApplicationController

    def create
        #todo: implement order proccess
        @result = "Simulating process: <br/> TODO: -CREATE ORDER AND OTHERS <br/> -CHECK FOR ORDER STATE <br/> -SIMULATE ORDER STATE <br/> -REPEAT"
        permitted_params = order_params
        @order = ProductRepository.create_order(permitted_params)
        render json: @order
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
