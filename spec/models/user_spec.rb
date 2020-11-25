require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

   describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user = FactoryBot.build(:user)
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user = FactoryBot.build(:user)
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailに@が含まれていないと登録できない" do
      @user = FactoryBot.build(:user)
      @user.email = "testexample.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "重複するemailが存在すると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "パスワードが空だと登録できない" do
      @user = FactoryBot.build(:user)
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードが英字のみの場合に登録ができない" do
      @user = FactoryBot.build(:user)
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードが数字のみの場合に登録ができない" do
      @user = FactoryBot.build(:user)
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードが5文字以下の場合に登録ができないこと" do
      @user = FactoryBot.build(:user)
      @user.password = "aa000"
      @user.password_confirmation = "aa000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "2回目のパスワードが空だと登録できない" do
      @user = FactoryBot.build(:user)
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "苗字が空だと登録できない" do
      @user = FactoryBot.build(:user)
      @user.family_name_jp = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name jp can't be blank")
    end
    it "名前が空だと登録できない" do
      @user = FactoryBot.build(:user)
      @user.first_name_jp = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name jp can't be blank")
    end
    it "苗字に全角漢字、ひらがな、カタカナ以外が入力されている場合に登録ができない" do
      @user = FactoryBot.build(:user)
      @user.family_name_jp = /\A[a-zA-Z0-9]+\z/
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name jp is invalid")
    end
    it "名前に全角漢字、ひらがな、カタカナ以外が入力されている場合に登録ができない" do
      @user = FactoryBot.build(:user) 
      @user.first_name_jp = /\A[a-zA-Z0-9]+\z/
      @user.valid?
      expect(@user.errors.full_messages).to include("First name jp is invalid")
    end
    it "フリガナ(苗字)が空だと登録できない" do
      @user = FactoryBot.build(:user)
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "フリガナ(名前)が空だと登録できない" do
      @user = FactoryBot.build(:user)
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "フリガナ(苗字)に全角カタカナ以外が入力されている場合に登録できないこと" do
      @user = FactoryBot.build(:user)
      @user.family_name_kana = /\A[ァ-ヶー－]+\z/
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "フリガナ(名前)に全角カタカナ以外が入力されている場合に登録できないこと" do
      @user = FactoryBot.build(:user)
      @user.first_name_kana = /\A[ァ-ヶー－]+\z/
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "生年月日が空だと登録できない" do
      @user = FactoryBot.build(:user)
      @user.birthday = ""
      @user.valid?  
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

