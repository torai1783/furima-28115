class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one :user
  has_one :item
  belongs_to :users_item

end

