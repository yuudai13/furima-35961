FactoryBot.define do
  factory :item do
    name                   { '太郎' }
    description            { 'ここには商品説明が入ります。' }
    category_id            { 3 }
    condition_id           { 3 }
    delivery_charge_id     { 3 }
    delivery_source_id     { 3 }
    shipping_day_id { 3 }
    price { 1000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
