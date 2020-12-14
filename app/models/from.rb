class order_users_items
  include ActiveModel::Model
  attr_accessor :users_items, :postalcood, :deliverysource_id, :city, :address, :tel, :building   

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :users_items
    validates :postalcood, format: {with: /^\d{3}[-]|\d{4}$/}
    validates :city
    validates :address
    validates :tel
    validates :building
  end

  with_options numericality: { other_than: 0 } do
    validates :deliverysource_id
  end

    def save
      @orders = Order.create(user_id: user_id, users_items_id: users_items_id)
      Address.create(postalcode: postalcode, deliverysource_id: deliverysource_id, city: city, address: address, building: building,tel: tel, users_items_id: users_items.id )
    end
end
