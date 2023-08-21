FactoryBot.define do
  factory :order_address do

    zipcode               { '123-4567'}
    shipping_origin_id    { '3'}
    city                  { '津軽市' } 
    street_address        { '大野1-2-5' }
    phone                 { '090213645692' }
    
  end
end
