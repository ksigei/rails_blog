class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  private

  after_create :comments_counter
  def comments_counter
    post = self.post
    post.comments_counter = post.comments.count
    post.save
  end
end
