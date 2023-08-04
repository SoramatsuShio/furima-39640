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
| name               | text    | null: false |
| address            | string  | null: false |
| phone              | text    | null: false |
| email              | text    | null: false |
| encrypted_password | string  | null: false |


- has_many :items
- has_many :orders
- has_many :auctions



# テーブル設計 table :item 

| Column                | Type    | Options     |
| ------------------    | ------  | ----------- |
| brand                 | text    | null: false |
| category              | string  | null: false |
| item name             | text    | null: false |
| minimum price         |Numeric  | null: false |
| pictures              |  BLOB   | null: false |
| user id               |references|            |


  belongs_to :user
  


# テーブル設計 table :order 

| Column             | Type     | Options     |
| ------------------ | ------   | ----------- |
| order numbers      | text     | null: false |
| delivery date      | date     | null: false |
| delivery time      |timestamp |             |
| payment method     | text     |             |
| user id            |references|             |

  belongs_to :auction
  belongs_to :user



# テーブル設計 table :auction 

| Column                   | Type    | Options     |
| ------------------       | ------  | ----------- |
| Bidder's user id         | text    | null: false |
| Bidder's prices          |Numeric  | null: false |
| Bidder's timestamp       |timestamp| null: false |
| Winning bidder's user id | text    | null: false |
| Bidded price             |Numeric  | null: false |
| Bidded timestamp         |timestamp| null: false |

  belongs_to :item
  belongs_to :user





* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
