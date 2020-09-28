class BookmarksController < ApplicationController

  def index
    @user = current_user
    @bookmarks = @user.bookmarks.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user_id = current_user.id
    @bookmark.save
    redirect_to bookmarks_path
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:title, :user_id, :quantity)
  end
end