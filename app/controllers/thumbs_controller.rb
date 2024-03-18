class ThumbsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment

  def create
    thumb = @comment.thumbs.create(user: current_user)

    if thumb.persisted?
      respond_to do |format|
        format.html { redirect_to @comment }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    thumb = @comment.thumbs.find_by(user: current_user)
    thumb&.destroy

    respond_to do |format|
      format.html { redirect_to @comment }
      format.turbo_stream
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end
