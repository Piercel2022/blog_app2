class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_initialize :initial
  after_save :update_user_post_counter

  validates :title, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_user_post_counter
    author.increment!(:posts_counter)
  end

  private

  def initial
    self.comments_counter ||= 0
    self.likes_counter ||= 0
  end
end
