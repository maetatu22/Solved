require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき'do
      it "formが全て存在していれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordが6文字以上であれば登録できる" do
        @user.password = "aaaa11"
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end

      it "self_introduction, gender_id, birthdayを入力しなくても登録できる" do
        @user.self_introduction = ""
        @user.gender_id = 1
        @birthday = ""
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "emailが重複していると登録できない" do
        @user.save
        second_user = FactoryBot.build(:user)
        second_user.email = @user.email
        second_user.valid?
        expect(second_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "emailに@がないと登録できない" do
        @user.email = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが半角英数字混合でないと登録できない" do
        @user.password = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字混合で入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      
    end
  end
end
