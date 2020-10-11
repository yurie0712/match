class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
  	@posts = Post.where(user_id: @user.id).order(id: "DESC")
    @likes = Like.where(user_id: @user.id)
    # PostTagsPostテーブルと結合したPostTagテーブルの@postsの配列にした情報からPostTagの情報を持ってくる。
    # distinct＝重複を避ける。使用時はカラムを指定する為、*→tagnameを記載。
    @posttags = PostTagsPost.select("post_tags.tagname").joins(:post_tag).where(post_id: @posts.pluck(:id)).distinct
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end