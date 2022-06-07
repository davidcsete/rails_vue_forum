class Comment < ApplicationRecord
  include ActiveModel::Serializers::JSON

  belongs_to :post
  belongs_to :user

  has_many :replies, class_name: "Comment",
                          foreign_key: "comment_id"

  belongs_to :comment, class_name: "Comment", optional: true

  scope :top_level, -> { where('comment_id = ?', nil) }
  # -> { where('published_at > ?', Time.now) }

  def descendents
    replies.map do |reply|
       reply.replies.length>0 ? JSON.parse(reply.to_json( {  methods: :descendents } )) : JSON.parse(reply.to_json)
      
    end
  end

end
