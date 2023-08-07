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
| family_name_zenkaku| text    | null: false |
| first_name_zenkaku | text    | null: false |
| family_name_kana   | text    | null: false |
| first_name_kana    | text    | null: false |
| date_of_birth      | date    | null: false |

has_many :user_items
has_many :items, through: :user_items
has_many :orders


## テーブル: items
| カラム名              | データ型 | オプション     |
| ------------------- | ------ | ----------- |
| category_id         | integer| null: false |
| item_status_id      | integer| null: false |
| delivery_charge_id  | integer| null: false |
| shipping_origin_id  | integer| null: false |
| days_until_dispatch_id|integer|null: false |

### ActiveHash
has_many :user_items
has_many :users, through: :user_items




## テーブル: orders

| Column            | Type     | Options              |
| ----------------- | -------- | -------------------- |
| zipcode           | string   | null: false          |
| prefecture        | varchar  | null: false          |
| city              | string   | null: false          |
| street_address    | string   | null: false          |
| building_name     | text     |                      |
| phone             | string   | null: false          |

belongs_to :user



## テーブル: user_items

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | bigint     | null: false, foreign_key: true |
| item_id       | bigint     | null: false, foreign_key: true |

belongs_to :user
belongs_to :item










* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
