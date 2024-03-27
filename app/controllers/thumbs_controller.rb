class ThumbsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment

  def create
    thumb = @comment.thumbs.create(user: current_user)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end

  def destroy
    thumb = @comment.thumbs.find_by(user: current_user)
    thumb&.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end
