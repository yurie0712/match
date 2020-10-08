class LikesController < ApplicationController

  def index
    @user = current_user
    @likes = Like.where(user_id: @user.id).order(id: "DESC")
    @liketags = LikeTagsLike.select("like_tags.*").joins(:like_tag).where(like_id: @likes.pluck(:id))
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
    @liketags = LikeTag.all.order(id: "DESC")
    @like = @tag.likes.all.order(id: "DESC")
  end

  private
  def like_params
    params.require(:like).permit(:caption, :user_id, :post_id, like_tag_ids: [])
  end

end
