class Api::PostController < ApplicationController
    def show
        @post = Post.where(id: params[:id])[0]
        render json: @post.to_json( { methods: :get_comments_json } )
    end

    def create

    end
end
