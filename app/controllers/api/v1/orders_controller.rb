class Api::V1::OrdersController < ApplicationController

    def create
        #todo: implement order proccess
        @result = "Simulating process: <br/> TODO: -CREATE ORDER AND OTHERS <br/> -CHECK FOR ORDER STATE <br/> -SIMULATE ORDER STATE <br/> -REPEAT"
        product_id =  params[:product_id]
        quantity =  params[:quantity]
        address =  params[:address]

        render json: @result
    end
end
