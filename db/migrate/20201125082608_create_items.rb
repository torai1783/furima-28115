class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
     t.references :user, foreign_key: true
     t.string :name, null: false, default: ""
     t.integer :price, null: false
     t.text :description, null: false
     t.integer :category_id, null: false
     t.integer :status_id, null: false
     t.integer :charge_id, null: false
     t.integer :deliverysource_id, null: false
     t.integer :deliveryday_id, null: false
     t.timestamps null: false
    end
  end
end
