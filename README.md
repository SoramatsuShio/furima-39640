# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation


## テーブル: users

| カラム名             | データ型   | オプション     |
| ------------------ | ------  | ----------- |
| nick_name          | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| family_name_zenkaku| string  | null: false |
| first_name_zenkaku |  string | null: false |
| family_name_kana   |  string | null: false |
| first_name_kana    |  string | null: false |
| date_of_birth      |  date   | null: false |
| id                 |integer |Auto Increment|
| item_id            |references|foreign_key |

has_many :user_items
has_many :items



## テーブル: items
| カラム名              | データ型 | オプション     |
| ------------------- | ------ | ----------- |
| item_name           | string | null: false |
| item_desc           | text   | null: false |
| category            | integer| null: false |
| item_status         | integer| null: false |
| delivery_charge_id  | integer| null: false |
| shipping_origin_id  | integer| null: false |
| days_until_dispatch_id|integer|null: false |
| mini_sell_price     |integer | null: false |
| id                  |integer |Auto Increment|

### ActiveHash
has_many :user_items

belongs_to users




## テーブル: orders

| Column            | Type     | Options              |
| ----------------- | -------- | -------------------- |
| zipcode           | string   | null: false          |
| prefecture        | genre_id | null: false          |
| city              | string   | null: false          |
| street_address    | string   | null: false          |
| building_name     | text     |                      |
| phone             | string   | null: false          |
| id                |integer   |Auto Increment        |
| item_id           |references|foreign_key           |


belongs_to :user
belongs_to :items



## テーブル: user_items

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | bigint     | null: false, foreign_key: true |
| item_id       | bigint     | null: false, foreign_key: true |
| order_id      | bigint     | null: false, foreign_key: true |

belongs_to :users
belongs_to :items
belongs_to :orders









* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
