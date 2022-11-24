class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :update_posts_counter

  # validations
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_five
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  after_initialize :init

  def init
    self.likes_counter ||= 0
    self.comments_counter ||= 0
  end
end
