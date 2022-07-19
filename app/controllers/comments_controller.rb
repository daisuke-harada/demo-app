class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(post_params.merge(user_id: current_user.id, post_id: params[:post_id]))
    @comment.save
  end

  def update
  end

  private
    def post_params
      params.require(:comment).permit(:text)
    end
end
