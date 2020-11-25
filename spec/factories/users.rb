FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"000aaa"}
    password_confirmation {password}
    family_name_jp        {"山田"}
    first_name_jp         {"太郎"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birthday              {"2000-01-01"}
  end
end