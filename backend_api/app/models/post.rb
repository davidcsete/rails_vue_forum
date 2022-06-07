class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments

  def get_comments_json
    comments.select{
      |comment|
      comment.comment_id == nil 
    }.map{ 
        |comment|
        JSON.parse(comment.to_json({ methods: :descendents }))
      }
  end
end
