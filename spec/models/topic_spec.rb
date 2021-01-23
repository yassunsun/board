require 'rails_helper'

RSpec.describe Topic, type: :model do
  before do
    @topic = FactoryBot.build(:topic)
  end

  describe 'トピックの保存' do
    context 'トピックが保存できる場合' do
      it "titleの値が存在すれば登録できること" do
        expect(@topic).to be_valid
      end
    end
    context 'トピックが保存できない場合' do
      it "titleが空では登録できないこと" do
        @topic.title = nil
        @topic.valid?
        expect(@topic.errors.full_messages).to include("Title can't be blank")
      end
    end
  end
end