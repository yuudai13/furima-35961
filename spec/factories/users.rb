FactoryBot.define do
  factory :user do
    nickname                   { "test" }
    email                      {Faker::Internet.free_email}
    password                   { "1234abcd" }
    password_confirmation      {password}
    last_name_full_width       {"柳澤"}
    first_name_full_width      {"悠大"}
    last_name_kana_full_width  {"ヤナギサワ"}
    first_name_kana_full_width {"ユウダイ"}
    birthday                   {"1993-01-13"}
  end
end