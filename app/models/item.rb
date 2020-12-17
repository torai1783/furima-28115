class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :deliverysource
  belongs_to :deliveryday
  belongs_to :user
  has_one_attached :image
  has_one :users_item
  

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :image 
    validates :description, length: { maximum: 1000 }
    validates_inclusion_of :price, in:300..9999999
    validates :price, format: {with: /\A[0-9]+\z/}
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :charge_id
    validates :deliverysource_id
    validates :deliveryday_id
  end
end
