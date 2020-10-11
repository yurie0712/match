class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
      @posts = Post.all.includes(:user).order(id: "DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def post_tag
    @user = current_user
    # @userのpostを指定する。
    @posts = Post.where(user_id: @user.id).order(id: "DESC")
    # PostTagsPostテーブルと結合したPostTagテーブルの@postsの配列にした情報からPostTagのtagname情報を持ってくる。
    @posttags = PostTagsPost.select("post_tags.tagname").joins(:post_tag).where(post_id: @posts.pluck(:id)).distinct
    # PostTagテーブルからtagnameを指定する
    @tag = PostTag.find_by(tagname: params[:name])
    # @tagのpost全てを指定する
    @post = @tag.posts.all
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption, :user_id, post_tag_ids: [])
  end
end