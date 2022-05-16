class HomeController < ActionController::Base
    def home
        @categories = Category.joins(:posts).group('categories.id')
        render json: @categories.to_json( { include: [ :posts ] } )
    end
end