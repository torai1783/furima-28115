class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    with_options presence: true do
      validates :nickname
      validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, messages: "Email can't be blank" }
      #validates :email, uniqueness: { case_sensitive: true }
      validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze,  messages: 'Include both letters and numbers', length: { minimum:6 }}
      validates :family_name_jp, format: { with: /\A[ぁ-んァ-ン一-龥]/, messages: "Family name jp can't be blank" }
      validates :first_name_jp, format: { with: /\A[ぁ-んァ-ン一-龥]/, messages: "First name jp can't be blank" }
      validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, messages: "Family name kana can't be blank" }
      validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, messages: "First name kana can't be blank" }
      validates :birthday
    end
end
