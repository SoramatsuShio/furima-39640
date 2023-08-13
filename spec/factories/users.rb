FactoryBot.define do
  factory :user do
    
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {'123456' } 
    password_confirmation {'123456'}
    family_name_zenkaku {'山田'}
    first_name_zenkaku {'陸太郎'}
    family_name_kana {'ヤマダ'}
    first_name_kana {'リクタロウ'}
    date_of_birth {'1945-11-15'}
      end
end

