class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :title, length: { maximum: 250 }

  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  after_save :update_posts_counter
  def update_posts_counter
    user = self.user
    user.posts_counter = user.posts.count
    user.save
  end
end
