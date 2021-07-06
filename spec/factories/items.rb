FactoryBot.define do
  factory :item do
    name                   { '太郎' }
    description            { 'ここには商品説明が入ります。' }
    category_id            { 'メンズ' }
    condition_id           { '新品・未使用' }
    delivery_charge_id     { '送料込み（出品者負担）' }
    delivery_source_id     { '静岡県' }
    shipping_day_id { '2~3日で発送' }
    price { '1000' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
