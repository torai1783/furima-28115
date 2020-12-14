class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :users
  has_one :items
  belongs_to :users_item

    with_options presence: true do
      validates :users_items
      validates :postalcood, format: {with: /\A\d{3}[-]\d{4}\z/}
      validates :city
      validates :address
      validates :tel
      validates :building
    end

    with_options numericality: { other_than: 0 } do
      validates :deliverysource_id
   end
end

