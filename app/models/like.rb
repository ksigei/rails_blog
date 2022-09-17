class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  private

  after_save :update_likes_counter
  def update_likes_counter
    post = self.post
    post.likes_counter = post.likes.count
    post.save
  end
end
