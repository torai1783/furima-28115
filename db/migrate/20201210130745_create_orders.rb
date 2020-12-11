class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|

      t.reference :users_items, foreign_key: true 
      t.string :postalcood, null: false
      t.string :municipality, null: false   
      t.string :address, null: false
      t.string :tel, null: false
      t.string :building, null: false 
      t.timestamps :deliverysource_id,
    end
  end
end
