class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: VALID_PASSWORD_REGEX,  message: 'Include both letters and numbers', length: { minimum:6 }
  validates :family_name_jp, presence: true
  validates :first_name_jp, presence: true
  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/
  validates :family_name_kana, presence: true, format: { with: KATAKANA_REGEXP }
  validates :first_name_kana, presence: true, format: { with: KATAKANA_REGEXP }
  validates :birthday, presence: true
end
