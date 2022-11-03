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
    return JSON.parse(nil.to_json) if replies.length == 0

    replies.map do |reply|
      JSON.parse(reply.to_json( {  methods: :descendents } ))
    end
  end

end
