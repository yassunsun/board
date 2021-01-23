require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe 'ポストの保存' do
    context "ポストが保存できる場合" do
      it "コメントがあればポストは保存される" do
        expect(@post).to be_valid
      end
    end
    context "ポストが保存できない場合" do
      it "コメントがないとポストは保存できない" do
        @post.comment = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Comment can't be blank")
      end
    end
  end
end
