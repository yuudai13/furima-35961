class Purchases < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :user_id, :item_id

  belongs_to :user
has_one :shipping_address
belongs_to :item

def save
  # 寄付情報を保存し、変数donationに代入する
  purchases = Purchases.create(item_id: item_id, user_id: user_id)
  # 住所を保存する
  # donation_idには、変数donationのidと指定する
  ShippingAddress.create(postal_code: postal_code, delivery_source_id: delivery_source_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, purchases_id: purchase.id)
end
end