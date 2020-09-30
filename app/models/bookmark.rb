class Bookmark < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :bookmark_tags

  # DBへのコミット直前に実施する
  after_create do
    # 1.Controller側でcreateしたbookmarkを取得
    bookmark = Bookmark.find_by(id: self.id)
    # 2.bookmarkのcaptionに打ち込まれたタグを検出
    bookmark_tags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    # 3.mapメソッドでbookmark_tags配列の要素一つ一つを取り出して、先頭の#を外した上でDBへ保存する
    bookmark_tags.uniq.map do |bookmarktag|
      tag = BookmarkTag.find_or_create_by(tagname: bookmarktag.downcase.delete('#'))
      bookmark.bookmark_tags << tag
    end
  end

  before_update do
    bookmark = Bookmark.find_by(id: self.id)
    bookmark.bookmark_tags.clear
    bookmark_tags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    bookmark_tags.uniq.map do |bookmarktag|
      tag = BookmarkTag.find_or_create_by(tagname: bookmarktag.downcase.delete('#'))
      # bookmarkに要素tagを追加した配列
      bookmark.bookmark_tags << tag
    end
  end
end
