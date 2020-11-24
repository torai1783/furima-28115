require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

   describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.nickname = ""
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.email = ""
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "パスワードが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.password = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "2回目のパスワードが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.password_confirmation = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it "苗字が空だと登録できない" do
      user = FactoryBot.build(:user)
      user.family_name_jp = ""
      user.valid?
      expect(user.errors.full_messages).to include("Family name jp can't be blank")
    end
    it "名前が空だと登録できない" do
      user = FactoryBot.build(:user)
      user.first_name_jp = ""
      user.valid?
      expect(user.errors.full_messages).to include("First name jp can't be blank")
    end
    it "フリガナ(苗字)が空だと登録できない" do
      user = FactoryBot.build(:user)
      user.family_name_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "フリガナ(名前)が空だと登録できない" do
      user = FactoryBot.build(:user)
      user.first_name_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "生年月日が空だと登録できない" do
      user = FactoryBot.build(:user)
      user.birthday = ""
      user.valid?  
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

