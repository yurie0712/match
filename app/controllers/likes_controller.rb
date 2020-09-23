class LikesController < ApplicationController

  def index
    @user = current_user
    @likes = @user.likes.all
  end

  def create
    post = Post.find(params[:post_id])
    like = current_user.likes.new(post_id: post.id)
    like.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post_id: post.id)
    like.destroy
    redirect_back(fallback_location: root_path)
  end
end
