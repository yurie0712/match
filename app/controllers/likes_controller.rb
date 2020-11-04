class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @likes = Like.where(user_id: @user.id).order(id: "DESC")
    # LikeTagsLikeテーブルと結合したLikeTagテーブルの@likesの配列にした情報からLikeTagの情報を持ってくる。
    # distinct＝重複を避ける。使用時はカラムを指定する為、*→tagnameを記載。
    @liketags = LikeTagsLike.select("like_tags.tagname").joins(:like_tag).where(like_id: @likes.pluck(:id)).distinct
  end

  def create
    @post = Post.find(params[:post_id])
    like = @post.likes.new(user_id: current_user.id)
    like.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post_id: @post.id)
    like.destroy
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
    @likes = Like.where(user_id: @user.id).order(id: "DESC")
    @liketags = LikeTagsLike.select("like_tags.tagname").joins(:like_tag).where(like_id: @likes.pluck(:id)).distinct
    @tag = LikeTag.find_by(tagname: params[:name])
    @like = @tag.likes.all.order(id: "DESC")
  end

  private
  def like_params
    params.require(:like).permit(:caption, :user_id, :post_id, like_tag_ids: [])
  end

end
