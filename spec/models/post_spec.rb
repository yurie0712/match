require 'rails_helper'

# Postモデルをテスト対象にしている
RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "データが正しく保存される" do
    before do
      @post = Post.new
      @post.title = "Hello WebCamp"
      @post.content = "今日も晴れです。"
      @post.save
    end
    it "全て入力してあるので保存される" do
      expect(@post).to be_valid
    end
  end
end
