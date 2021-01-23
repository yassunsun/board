require 'rails_helper'

# Basic認証
def basic(path)
  username = ENV["BASIC_AUTH_USER"] 
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "スレッド作成", type: :system do
  before do
    @topic = FactoryBot.build(:topic)
  end

  context 'スレッドの作成ができる場合' do
    it 'ログインしたユーザーは新規スレッドの作成ができる' do
      # ユーザーをDBに保存する
      @user = FactoryBot.create(:user)
      # トップページに移動する
      basic root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページへ遷移することを確認する
      expect(current_path).to eq root_path
      # トップページに新規スレッド作成ページへ遷移するボタンがある
      expect(page).to have_content('新規スレッド作成')
      # 新規スレッド作成ページに移動する
      visit new_topic_path
      # スレッド名を入力する
      fill_in 'topic_title', with: @topic.title
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Topic.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq root_path
    end
  end
  context 'スレッドの作成ができない場合' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      
    end
  end
end
