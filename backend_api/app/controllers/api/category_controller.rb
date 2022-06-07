class Api::CategoryController < ApplicationController
    def show
        @post = Post.includes(:user).where(category_id: params[:id])
        render json: @post.to_json(:include => :user)
    end
end
