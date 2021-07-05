class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tesm

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :category
    validates :condition
    validates :delivery_charge
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :Delivery_charge_id
  end
end
