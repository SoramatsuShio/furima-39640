FactoryBot.define do
  factory :item do
    
    item_name             { 'テスト）中古品お習字セット'}
    item_desc             { 'テスト）中古品お習字セットです。使用感はさほどありません。　写真画像をよくご覧の上入札ください。'}
    category_id           { '2' } 
    item_status_id        { '2' }
    delivery_charge_id    { '2' }
    shipping_origin_id    { '2' }
    days_until_dispatch_id { '2' }
    mini_sell_price        { '1000' }
    
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end


  end
end

