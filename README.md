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
| family_name(CAP)   | text    | null: false |
| first_name (CAP)   | text    | null: false |
| family_name(Kana)  | text    | null: false |
| first_name (Kana)  | text    | null: false |
| date_of_birth      | date    | null: false |
| nick_name          | text    | null: false |
| email              | text    | null: false |
| encrypted_password | string  | null: false |
| order_id           | references|           |

- has_many :items
- has_many :orders
- has_many :auctions



# テーブル設計 table :item 

| Column                | Type    | Options     |
| ------------------    | ------  | ----------- |
| pictures              | BLOB    | null: false |
| item_name             | text    | null: false |
| item_description      | string  | null: false |
| category              | VARCHAR | null: false |
| item_status           | VARCHAR | null: false |
| delivery_charge       | VARCHAR | null: false |
| shipping_origin       | VARCHAR | null: false |
| days_until_dispatch   | VARCHAR | null: false |
| initial_bid_price     | numeric | null: false |
| user_id               |references|            |
| order_id              |references|            |

  belongs_to :user
  


# テーブル設計 table :order 

| Column             | Type     | Options     |
| ------------------ | ------   | ----------- |
| delivery_zip_code  | VARCHAR  | null: false |
| prifecture         | VARCHAR  | null: false |
| city               | string   | null: false |
| street_address     | string   | null: false |
| build_number       | string   |             |
| phone_number       | VARCHAR  | null: false |
| user_id            |references|             |
| order_id           | VARCHAR  | SERIAL      |


  belongs_to :auction
  belongs_to :user


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
