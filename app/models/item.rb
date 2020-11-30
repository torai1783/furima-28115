class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :deliverysource
  belongs_to :deliveryday
  has_one_attached :image
  has_many :users_items
  has_many :users, through: :users_items
  

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :image 
    validates :description, length: { maximum: 1000 }
    validates_inclusion_of :price, in:300..9999999
    validates :price, format: {with: /\A[0-9]+\z/}
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }  
    validates :charge_id, numericality: { other_than: 1 } 
    validates :deliverysource_id, numericality: { other_than: 0 } 
    validates :deliveryday_id, numericality: { other_than: 1 }
  end
end