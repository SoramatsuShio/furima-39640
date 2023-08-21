class OrderAddress
  include ActiveModel::Model
   attr_accessor :user_id, :item_id, :zipcode, :shipping_origin_id, :city, :street_address, :building_name, :phone
 


  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zipcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :shipping_origin_id
    validates :city
    validates :street_address
    validates :phone
   end
    
  def save
    # 商品情報を保存し、変数orderに代入する
    order = Order.create(user_id: user_id ,item_id: item_id)
    # 住所を保存する
    # address_idには、変数addressのidと指定する
    Address.create(zipcode: zipcode, shipping_origin_id: shipping_origin_id, city: city, street_address: street_address,
      building_name: building_name, phone: phone, order_id: order_id, user_id: user_id, item_id: item_id
      )
  end


end

