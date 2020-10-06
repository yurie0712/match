module BookmarksHelper
  def render_with_bookmark_tags(caption)
    caption.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) { |word| link_to word, "/bookmark/bookmark_tag/#{word.delete("#")}",data: {"turbolinks" => false} }.html_safe
  end

  def render_with_bookmarks(title)
    title.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) { link_to "/bookmark/#",data: {"turbolinks" => false} }.html_safe
  end
end
