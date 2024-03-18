class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @like = @post.likes.create(user: current_user)

    if @like.persisted?
      respond_to do |format|
        format.html { redirect_to @post }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @like = @post.likes.find_by(user: current_user)
    @like&.destroy

    respond_to do |format|
      format.html { redirect_to @post }
      format.turbo_stream
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
