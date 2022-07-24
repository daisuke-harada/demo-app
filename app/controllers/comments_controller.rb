class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(post_params.merge(user_id: current_user.id, post_id: params[:post_id]))
    @post = @comment.post
    if @comment.save
      @post.save_notification_comment!(current_user, @comment.id, @post.user_id)
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def update
  end

  private
    def post_params
      params.require(:comment).permit(:text)
    end
end
