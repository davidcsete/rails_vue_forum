class Api::CommentController < ApplicationController
    def show
        @comments = Comment.where(post_id: params[:id], comment_id: nil).order(created_at: :desc)
        render json: @comments.to_json( {  methods: :descendents } )
    end
end