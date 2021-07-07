class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_source
  belongs_to :shipping_day

  belongs_to :user
  has_one :purchase
  has_one_attached :image


  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :delivery_source_id
    validates :shipping_day_id
    validates :price
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :shipping_day_id
  end

  with_options numericality: { other_than: 0 } do
   validates :delivery_source_id
  end



  validates :price, numericality: { with: /\A\d+\z/ }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 99_999_999}

end
