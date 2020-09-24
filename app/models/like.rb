class Like < ApplicationRecord

  belongs_to :user
  belongs_to :post
  has_and_belongs_to_many :like_tags

  before_update do
    # self.id = 実態を含んだidの変数
    like = Like.find_by(id: self.id)
    like.like_tags.clear
    # likeのcaptionに打ち込まれたタグを検出
    like_tags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    # .uniq 同じものを排除する
    # .map  排除した集合体から、一つずつ26〜28行目の処理をする
    like_tags.uniq.map do |liketag|
      # 「#」を削除し、全て小文字にした文言からタグを検索し、見つからなかったら新しく生成する
      tag = LikeTag.find_or_create_by(tagname: liketag.downcase.delete('#'))
      # 親：likeの子：like_tagへ追加する
      like.like_tags << tag
    end
  end
end
