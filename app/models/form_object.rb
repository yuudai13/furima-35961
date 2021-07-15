class FormObject
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :delivery_source_id, :municipalities, :address, :building_name, :phone_number, :purchase_id, :token


  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :delivery_source_id
    validates :municipalities
    validates :address
    validates :phone_number
    validates :token
  end
  validates :delivery_source_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :phone_number, numericality: true
  validates :phone_number, length: {minimum: 10, maximum: 11 }

  def save
   purchase = Purchase.create(item_id: item_id, user_id: user_id)
   ShippingAddress.create(postal_code: postal_code, delivery_source_id: delivery_source_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number)
  end
 end

