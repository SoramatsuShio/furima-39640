class OrderAddress
  include ActiveModel::Model
   attr_accessor :user_id, :item_id, :zipcode, :shipping_origin_id, :city, :street_address, :building_name, :phone,:token
 


  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zipcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :shipping_origin_id, numericality: { other_than: 1 , message: "は---以外で入力してください"}
    validates :city
    validates :street_address
    validates :phone, format: {with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数値のみで入力してください"}
    validates :token
   end
    





  def save
    # 商品情報を保存し、変数orderに代入する
    order = Order.create(user_id: user_id ,item_id: item_id)
    # 住所を保存する
    # address_idには、変数addressのidと指定する
    
    Address.create(zipcode: zipcode, shipping_origin_id: shipping_origin_id, city: city, street_address: street_address,
      building_name: building_name, phone: phone, order_id: order[:id]
    )
    end


end

