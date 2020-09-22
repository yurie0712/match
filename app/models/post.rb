class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_and_belongs_to_many :post_tags
  attachment :image

  # postのお気に入り判定　→ view側で呼び出し
  def like_by?(user)
    likes.where(user_id: user.id).exists?
  end

  # DBへのコミット直前に実施する
  after_create do
    # 1.Controller側でcreateしたpostを取得
    post = Post.find_by(id: self.id)
    # 2.postのcaptionに打ち込まれたタグを検出
    post_tags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    # 3.mapメソッドでpost_tags配列の要素一つ一つを取り出して、先頭の#を外した上でDBへ保存する
    post_tags.uniq.map do |posttag|
      tag = PostTag.find_or_create_by(tagname: posttag.downcase.delete('#'))
      post.post_tags << tag
    end
  end

  before_update do
    post = Post.find_by(id: self.id)
    post.post_tags.clear
    post_tags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    post_tags.uniq.map do |posttag|
      tag = PostTag.find_or_create_by(tagname: posttag.downcase.delete('#'))
      # postに要素tagを追加した配列
      post.post_tags << tag
    end
  end
end