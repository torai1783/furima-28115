require 'rails_helper'

RSpec.describe User, type: :model do
   describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      user = User.new(nickname:"yamada", email: "",password:"000000", password_confirmation: "000000" )
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "パスワードが空だと登録できない" do
      user = User.new(nickname:"yamada", email: "kkk@gmail.com",password:"", password_confirmation: "000000" )
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "2回目のパスワードが空だと登録できない" do
      user = User.new(nickname:"yamada", email: "kkk@gmail.com",password:"000000", password_confirmation: "" )
      user.valid?
      expect(user.errors.full_messages).to include("Password Include both letters and numbers")
    end
  end
end
