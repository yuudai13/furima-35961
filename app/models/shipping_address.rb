class ShippingAddress < ApplicationRecord
  belongs_to  :purchases
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_charge_id, :municipalities, :address, :building_name, :phone_number, :purchases_id

  with_options presence: true do
    validates :postal_code
    validates :delivery_source_id
    validates :municipalities
    validates :address
    validates :building_name
    validates :phone_number
    validates :purchases_id
  end
end
