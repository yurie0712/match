class LikesController < ApplicationController

  def index
    @user = current_user
    @likes = @user.likes.all
    @liketags = LikeTag.all
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

  def edit
    @like = Like.find(params[:id])
  end

  def update
    @like = Like.find(params[:id])
    @like.update(like_params)
    redirect_to likes_path
  end

  def like_tag
    @user = current_user
    @tag = LikeTag.find_by(tagname: params[:name])
    @like = @tag.likes.all
  end

  private
  def like_params
    params.require(:like).permit(:caption, :user_id, :post_id, like_tag_ids: [])
  end

end
