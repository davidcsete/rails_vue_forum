class Api::CommentController < ApplicationController
    def show
        @comments = Comment.where(id: params[:id]).order(created_at: :desc)
        render json: @comments.to_json( { methods: :descendents } )
    end

    def create
        post = Post.find(params[:post_id])
        comment = post.messages.new(comment_params)
        comment.created_by = current_user.id
        if comment.save!
            ActionCable.server.broadcast "post_#{post.id}", comment: comment
        end
        json_response(room, :created)
    end

    private

    def message_params
      params.permit(:comment)
    end
end
