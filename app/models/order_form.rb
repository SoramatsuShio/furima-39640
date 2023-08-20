class OrderForm
  include ActiveModel::Model
  attr_accessor :zipcode, :mini_sell_price, :order_id, :user_id, :item_id 
  attr_accessor :image, :item_name, :item_desc, :category_id, :item_status_id, :delivery_charge_id, :shipping_origin_id, :days_until_dispatch_id

  with_options presence: true do
    validates :mini_sell_price, numericality: {only_integer: true, greater_than_or_equal_to: 299, less_than_or_equal_to: 9999999, message: 'is invalid'}
    validates :user_id
    validates :item_id
    validates :order_id
    validates :zipcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }

    # 商品画像一枚は必須
    validates :image, presence: { message: "at least one picture needs to be attached" }
   
    # 商品名は必須
    validates :item_name
    # アイテム説明は必須で、最大1000文字まで
    validates :item_desc
    # カテゴリー、商品状態、送料、出品地域、発送までの日数はそれぞれ必須
    validates :category_id, numericality: { other_than: 1 }
    validates :item_status_id, numericality: { other_than: 1 }
    validates :delivery_charge_id, numericality: { other_than: 1 }
    validates :shipping_origin_id, presence: true, numericality: { other_than: 1 }
    validates :days_until_dispatch_id, numericality: { other_than: 1 }
    
  end
    
  def save
    # 商品情報を保存し、変数orderに代入する
    order = Order.create(mini_sell_price: mini_sell_price, user_id: user_id)
    # 住所を保存する
    # address_idには、変数addressのidと指定する
    Address.create(zipcode: zipcode, prefecture_id: prefecture_id, city: city, street_address: street_address,
      building_name: building_name, phone: phone, order_id: order_id, user_id: user_id, item_id: item_id,
      mini_sell_price: mini_sell_price)
  end


    #def save
     # if valid?
      # 販売情報を保存し、変数priceに代入する
      #price = Price.create(price: mini_sell_price, user_id: user_id)
      # 住所を保存する
      # order_idには、変数orderのidと指定する
      #Order.create(
       # zipcode: zipcode, prefecture_id: prefecture_id, city: city, street_address: street_address,
        #building_name: building_name, phone: phone, order_id: order_id, user_id: user_id, item_id: item_id,
        #mini_sell_price: mini_sell_price
     # )
    #else
     # false
    #end
  #end
end

