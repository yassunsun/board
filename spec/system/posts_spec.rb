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
  end

  context 'コメントの投稿に失敗する場合' do
    it '送る値が空のためコメントの投稿に失敗する' do
      # サインインする
      sign_in(@topic_user.user)
      # 作成されたチャットルームへ遷移する
      click_on(@@topic_user.topic.title)
      # DBに保存されていないことを確認する

      # 元のページに戻ってくることを確認する

    end
  end
end
