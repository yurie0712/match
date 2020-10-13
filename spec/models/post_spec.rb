require 'rails_helper'

# Postモデルをテスト対象にしている
RSpec.describe Post, type: :model do
  context "データが正しく保存される" do
    before do
      @post = Post.new
      @post.image = ""
      @post.caption = ""
      @post.save
    end
    it "全て入力してあるので保存される" do
      expect(@post).to be_valid
    end
  end
end
