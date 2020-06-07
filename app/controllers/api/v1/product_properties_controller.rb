class Api::V1::ProductPropertiesController < ApplicationController
    def index
        @product_properties = ProductRepository.all_product_properties
        render json: @product_properties
    end
end
