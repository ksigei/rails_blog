class CommentsController < ApplicationController
  def comments
    @comments = Comment.find(:all)
    @post = comments.post.find(:all)
  end
end
