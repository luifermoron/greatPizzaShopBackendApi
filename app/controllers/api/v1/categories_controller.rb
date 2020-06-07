class Api::V1::CategoriesController < ApplicationController
    def index
        @categories = CategoryRepository.all
        render json: @categories
    end
end
