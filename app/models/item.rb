class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charges
  belongs_to :deliverysource
  belongs_to :deliverydays
  has_one_atached :image
  has_many :users_items
  has_many :users, through: :users_items
  

  with_options presence: true do
    validates :name, numericality: { other_than: 1 }, length: {minimum:40}
    validates :image, numericality: { other_than: 1 }
    validates :description, numericality: { other_than: 1 }
    #validates :price, format:　{ with: /\A[300-9,999,999]\z/}, numericality: { other_than: 1 }
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }  
    validates :charges_id, numericality: { other_than: 1 } 
    validates :deliverysource_id, numericality: { other_than: 1 } 
    validates :deliverydays_id, numericality: { other_than: 1 }
  end
end

#validates_inclusion_of
