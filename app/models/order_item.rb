class OrderItem
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postalcode, :deliverysource_id, :city, :address, :tel, :building, :users_item_id, :token, :price  

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postalcode, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :city
    validates :address
    validates :tel, format: {with: /\A\d{11}\z/}
    validates :deliverysource_id
    validates :token
  end
  
  with_options numericality: { other_than: 0 } do
    validates :deliverysource_id
  end

  def save
    #USERITEMSテーブルに保存する記述が必要。
     #＠ordersはUSERITEMSテーブルに保存されたレコードが入っている。（🆔がある。）
     users_item = UsersItem.create(user_id: user_id, item_id: item_id)
     Order.create(postalcode: postalcode, deliverysource_id: deliverysource_id, city: city, address: address, building: building,tel: tel, users_item_id: users_item.id)
     #Orderテーブルに保存する記述が必要。
  end
end
