class Api::PostController < ApplicationController
    def show
        @post = Post.where(category_id: params[:id])
        render json: @post.to_json
    end
end
