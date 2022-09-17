class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_comments_counter
  def update_comments_counter
    post = self.post
    post.comments_counter = post.comments.count
    post.save
  end
end
