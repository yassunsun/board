require 'rails_helper'

# Basic認証
def basic(path)
  username = ENV["BASIC_AUTH_USER"] 
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "コメント投稿", type: :system do
  before do
    @topic_user = FactoryBot.create(:topic_user)
    @post_comment = Faker::Lorem.sentence
  end

  context 'コメントの投稿に成功する場合' do
    it 'コメントの投稿に成功すると、投稿した内容が表示される' do
      # ログインする
      sign_in(@topic_user.user)
      # 作成されたスレッドへ遷移する
      click_on(@topic_user.topic.title)
      # 値をコメントフォームに入力する
      fill_in 'comment', with: @post_comment
      # 非同期通信で送信した値がDBに保存されていることを確認する
      wait_for_ajax do
        expect {
          find('input[name="commit"]').click
        }.to change { Post.count }.by(1)
      end
      # コメント投稿ページにリダイレクトされる
      expect(current_path).to eq topic_posts_path(@topic_user.topic)
      # 送信した値がブラウザに表示されていることを確認する
      expect(page).to have_content(@post_comment)
    end
  end
  context 'コメントの投稿に失敗する場合' do
    it '送る値が空のためコメントの投稿に失敗する' do
      # ログインする
      sign_in(@topic_user.user)
      # 作成されたスレッドへ遷移する
      click_on(@topic_user.topic.title)
      # コメントを空にする
      fill_in 'comment', with: nil
      # DBに保存されていないことを確認する
      expect {
        find('input[name="commit"]').click
      }.not_to change{Post.count}
      # 元のページに戻ってくることを確認する
      expect(current_path).to eq topic_posts_path(@topic_user.topic)
    end
  end
end
