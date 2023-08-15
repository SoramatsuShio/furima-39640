class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_charge
  belongs_to :shipping_origin
  belongs_to :days_until_dispatch
  has_one_attached :image

  validates :item_name, presence: true

  # アイテム説明は必須で、最大1000文字まで
  validates :item_desc, presence: true

  # カテゴリー、商品状態、送料、出品地域、発送までの日数はそれぞれ必須
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :item_status_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_origin_id, presence: true, numericality: { other_than: 1 }
  validates :days_until_dispatch_id, presence: true, numericality: { other_than: 1 }

  # 最低販売価格は必須で、0以上の数値
  validates :mini_sell_price, presence: { message: "can't be blank" }, numericality: { greater_than_or_equal_to: 0, message: "must be a number greater than or equal to 0" }


  
end
