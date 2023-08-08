# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation




## テーブル: Users

| カラム名            | データ型 | オプション   |
| ----------------- | ---------- |--------- |
| nick_name          | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| family_name_zenkaku| string  | null: false |
| first_name_zenkaku |  string | null: false |
| family_name_kana   |  string | null: false |
| first_name_kana    |  string | null: false |
| date_of_birth      |  date   | null: false |

has_many :orders
has_many :items





## テーブル: Items
| カラム名             | データ型 | オプション |
| ------------      - |----------|-------------- |
| item_name           | string | null: false |
| item_desc           | text   | null: false |
| category_id         |integer | null: false |
| item_status_id      |integer | null: false |
| delivery_charge_id  |integer | null: false |
| shipping_origin_id  |integer | null: false |
| days_until_dispatch_id|integer|null: false |
| mini_sell_price     |integer | null: false |
| id                  |references|null: false,foreign_key: true|

belong_to :user
has_one : order



## テーブル: Orders

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | integer    | null: false, foreign_key: true |
| item_id       | integer    | null: false, foreign_key: true |


belongs_to :user
belongs_to :item


## テーブル: Addresses

| Column            | Type     | Options              |
| ------------- | ---------- | ------------------------------ |
| zipcode           | string   | null: false          |
| prefecture_id     | integer  | null: false          |
| city              | string   | null: false          |
| street_address    | string   | null: false          |
| building_name     | string   |                      |
| phone             | string   | null: false          |
| order_id          |references| foreign_key          |

belongs_to :order









* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
