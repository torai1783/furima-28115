# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :nickname, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :family_name_jp, null: false, default: ""
      t.string :family_name_kana, null: false, default: ""
      t.string :first_name_kana, null: false, default: ""
      t.date :birthday, null: false
    end
  end
end
