module LikesHelper
  def render_with_like_tags(caption)
    caption.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) { |word| link_to word, "/like/like_tag/#{word.delete("#")}",data: {"turbolinks" => false} }.html_safe
  end
end
