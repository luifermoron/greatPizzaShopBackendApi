class Api::V1::ProductsController < ApplicationController
    def index
        @products = ProductRepository.all_products
        render json: @products
    end
end
