# app/channels/chat_channel.rb
class PostChannel < ApplicationCable::Channel
  def subscribed
    stream_from "post_#{params[:post_id]}"
  end
end
