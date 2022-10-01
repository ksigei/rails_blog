class CommentsController < ApplicationController
  def comments
    @comments = Comment.includes(:post).all

    respond_to do |format|
      format.html 
      format.json { render json: @comments }
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create(comments_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      flash[:success] = 'Comment created!'
      redirect_to user_post_path(current_user, @post)
    else
      flash.now[:error] = 'Something went wrong'
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:text)
  end
end
