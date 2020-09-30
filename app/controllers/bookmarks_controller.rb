class BookmarksController < ApplicationController

def index
  @user = current_user
  @bookmarks = @user.bookmarks.all.order(id: "DESC")
  @bookmarktags = BookmarkTag.all
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

def edit
  @bookmark = Bookmark.find(params[:id])
end

def update
  @bookmark = Bookmark.find(params[:id])
  @bookmark.update(bookmark_params)
  redirect_to bookmarks_path
end

def destroy
end

def bookmark_tag
  @user = current_user
  @tag = BookmarkTag.find_by(tagname: params[:name])
  @bookmark = @tag.bookmarks.all
end

private

def bookmark_params
  params.require(:bookmark).permit(:title, :user_id, :caption, bookmark_tag_ids: [])
end

end