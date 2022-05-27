class Api::HomeController < ApplicationController
    def index
        @categories = Category.joins(:posts).group('categories.id')
        render json: @categories.to_json
    end
end