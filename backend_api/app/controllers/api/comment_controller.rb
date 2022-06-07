class Api::CommentController < ApplicationController
    def show
        @comments = Comment.where(id: params[:id]).order(created_at: :desc)
        render json: @comments.to_json( { methods: :descendents } )
    end
end