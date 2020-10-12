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

  def hide
    @user = User.find(params[:id])
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    @user.update(is_deleted: true)
    #ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end