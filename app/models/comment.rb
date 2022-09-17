class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def comments_counter
    post = self.post
    post.comments_counter = post.comments.count
    post.save
  end
end
