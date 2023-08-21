class Address < ApplicationRecord

  

| Column            | Type     | Options              |
| ------------- | ---------- | ------------------------------ |
| zipcode           | string   | null: false          |
| shipping_origin_id | integer  | null: false          |
| city              | string   | null: false          |
| street_address    | string   | null: false          |
| building_name     | string   |                      |
| phone             | string   | null: false          |
| order             |references|null: false,foreign_key: true|

validates :category_id, numericality: { other_than: 1 }

validates :category_id, numericality: { other_than: 1 }
zipcode,




end
