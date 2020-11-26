class Item < ApplicationRecord
  has_many :users_items
  has_many :users, through: :users-items
end

  #with_options presence: true do

  　　#validates :name, format: {with: length:{minimam 40}}
  　　#validates :image
  　　#validates :description
  　　#validates :price, format: { with: [0-9]}
  　　#validates :category_id
  　　#validates :status_id  
  　　#validates :charges_id 
  　　#validates :deliverysource_id 
  　　#validates :deliverydays_id
  #end
end
