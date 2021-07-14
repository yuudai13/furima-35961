FactoryBot.define do
  factory :form_object do
    item_id {1}
    user_id {1}
    postal_code { '437-1621' }
    delivery_source_id  {3 }
    municipalities { '御前崎市' }
    address { '52-7' }
    phone_number { '0548634353' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
