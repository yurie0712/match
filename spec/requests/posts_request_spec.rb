require 'rails_helper'

# Postsコントローラをテスト対象にする
RSpec.describe "Posts", type: :request do
  # 新規投稿ページのテストである
  describe '新規投稿ページ' do
    # 新規投稿ページの正しく表示されることに関するものをまとめる
    context "新規投稿ページが正しく表示される" do
      # itの前に'新規投稿ページを表示する'
      before do
        get new_post_path
      end
      # response.statusを受け取ることができるようにさせる
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end
  end
end
