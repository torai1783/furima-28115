class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|

      t.references :users_item, foreign_key: true 
      t.string :postalcode, null: false
      t.integer :deliverysource_id, null: false
      t.string :city, null: false   
      t.string :address, null: false
      t.string :tel, null: false
      t.string :building, null: false 
      t.timestamps 
    end
  end
end
