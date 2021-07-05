class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tesm

  belongs_to :user
  has_one :purchase
  has_one_attached :image

validates :delivery_source_id, numericality: { other_than: 0 }

  with_options presence: true do
    validates :category
    validates :condition
    validates :delivery_charge
    validates :delivery_source
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
  end
end
