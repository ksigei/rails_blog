class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = user.posts.find(:all)
  end

  def show
    @post = Post.find(params[:id])
  end
end
