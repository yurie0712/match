module PostsHelper
  def render_with_post_tags(caption)
    caption.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) { |word| link_to word, "/post/post_tag/#{word.delete("#")}",data: {"turbolinks" => false} }.html_safe
  end
end