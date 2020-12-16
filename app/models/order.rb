class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :users
  has_one :items
  belongs_to :users_item
end

