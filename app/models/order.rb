class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :users
  has_one :items
  belongs_to :users_item

    with_options presence: true do
      validates :users_items
      validates :postalcood, format: { with: ^[0-9]{3}-[0-9]{4}$, }
      validates :deliverysource_id
      validates :city
      validates :address
      validates :tel
      validates :building, format:  {with: /\A[0-9]+\z/}
   end
end

