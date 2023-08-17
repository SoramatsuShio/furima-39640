class Item < ApplicationRecord
  
  has_one_attached :image

  belongs_to :user
  #has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_charge
  belongs_to :shipping_origin
  belongs_to :days_until_dispatch


  # 商品画像一枚は必須
  validates :image, presence: { message: "at least one picture needs to be attached" }
  # 商品名は必須
  validates :item_name, presence: true
  # アイテム説明は必須で、最大1000文字まで
  validates :item_desc, presence: true
  # カテゴリー、商品状態、送料、出品地域、発送までの日数はそれぞれ必須
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :item_status_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_origin_id, presence: true, numericality: { other_than: 1 }
  validates :days_until_dispatch_id, presence: true, numericality: { other_than: 1 }
 # 最低販売価格は必須で、300以上9999999以下の数値
  validates :mini_sell_price, presence: { message: "can't be blank" },
  numericality: { 
  greater_than_or_equal_to: 300,
  less_than_or_equal_to: 9_999_999,
  only_integer: true
  }
  


end
