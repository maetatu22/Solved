require 'rails_helper'

RSpec.describe Problem, type: :model do
  before do
    @problem = FactoryBot.build(:problem)
  end

  describe '投稿の保存' do
    context "投稿が保存できる場合" do
      it "全項目があれば投稿が保存される" do
        expect(@problem).to be_valid
      end
    end
    context "投稿が保存できない場合" do
      it "titleが空だと登録できない" do
        @problem.title = ""
        @problem.valid?
        expect(@problem.errors.full_messages).to include("タイトルを入力してください")
      end
      it "titleが20文字より多いと登録できない" do
        @problem.title = "1234567890123456789012"
        @problem.valid?
        expect(@problem.errors.full_messages).to include("タイトルは20文字以内で入力してください")
      end
      it "textが空だと登録できない" do
        @problem.text = ""
        @problem.valid?
        expect(@problem.errors.full_messages).to include("テキストを入力してください")
      end
      it "textが14文字以下だと登録できない" do
        @problem.text = "aaa"
        @problem.valid?
        expect(@problem.errors.full_messages).to include("テキストは15文字以上で入力してください")
      end
      it "textが200文字以上だと登録できない" do
        @problem.text = "123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"
        @problem.valid?
        expect(@problem.errors.full_messages).to include("テキストは200文字以内で入力してください")
      end
      it "genreが選択されていないと登録できない" do
        @problem.genre_id = 1
        @problem.valid?
        expect(@problem.errors.full_messages).to include("ジャンルを選んで下さい")
      end
    end

  end
end
