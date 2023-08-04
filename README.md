# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation


# テーブル設計 table :user 

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| family_name_kanji  | text    | null: false |
| first_name_kanji   | text    | null: false |
| family_name_kana   | text    | null: false |
| first_name_kana    | text    | null: false |
| date_of_birth      | date    | null: false |
| nick_name          | string  | null: false, unique|
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| order_id           | references|           |

- has_many :items
- has_many :orders




# テーブル設計 table :item 

| Column                | Type    | Options     |
| ------------------    | ------  | ----------- |
| item_name             | string  | null: false |
| item_description      | text    | null: false |
| category              | integer | null: false |
| item_status           | VARCHAR | null: false |
| delivery_charge       | VARCHAR | null: false |
| shipping_origin       | VARCHAR | null: false |
| days_until_dispatch   | VARCHAR | null: false |
| initial_bid_price     | integer | null: false |

  belongs_to :user
  belongs_to :order 


# テーブル設計 table :order 

| Column             | Type     | Options     |
| ------------------ | ------   | ----------- |
| delivery_zip_code  | VARCHAR  | null: false |
| prifecture         | integer  | null: false |
| city               | string   | null: false |
| street_address     | string   | null: false |
| build_number       | string   |             |
| phone_number       | VARCHAR  | null: false |
| order_id           | VARCHAR  | SERIAL      |


  belongs_to :user



# テーブル設計 table :user_order_auction 

| Column             | Type     | Options     |
| ------------------ | ------   | ----------- |
| user_id            |references|             |
| order_id           |references|             |

  belongs_to :user
  belongs_to :item
  belongs_to :order










* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
