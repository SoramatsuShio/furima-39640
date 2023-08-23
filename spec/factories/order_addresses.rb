FactoryBot.define do
  factory :order_address do

    zipcode               { '123-4567'}
    shipping_origin_id    { 3 }
    city                  { '津軽市' } 
    street_address        { '大野1-2-5' }
    phone                 { '09021364569' }
    building_name         { '津軽駅前ビル' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
