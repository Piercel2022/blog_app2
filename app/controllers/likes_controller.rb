class LikesController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    @like = Like.new
    @like.post = @post
    @like.author = current_user

    if @like.save
      # redirect_to the just liked post
      redirect_to user_post_path(@post.author, @post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # liked post
  def set_post
    @post = Post.find(params[:post_id])
  end
end
