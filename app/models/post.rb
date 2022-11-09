class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_user_post_counter

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_user_post_counter
    author.increment!(:posts_counter)
  end
end