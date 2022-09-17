class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  after_create :update_posts_counter
  def update_posts_counter
    user = self.user
    user.posts_counter = user.posts.count
    user.save
  end
end
