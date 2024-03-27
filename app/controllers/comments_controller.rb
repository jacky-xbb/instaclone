class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.create!(comment_params.merge(user: current_user))

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = 'Comment was successfully created.' }
      format.html { redirect_to root_path, notice: 'Comment was successfully created.' }
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
