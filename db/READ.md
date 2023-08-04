# テーブル設計 table :User 

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| Name               | text    | null: false |
| Address            | string  | null: false |
| Phone              | text    | null: false |
| Email              | text    | null: false |
|encrypted_password  | string  | null: false |


- has_many :items


# テーブル設計 table :item 

| Column                | Type    | Options     |
| ------------------    | ------  | ----------- |
| Brand                 | text    | null: false |
| Category              | string  | null: false |
| Item name             | text    | null: false |
| Minimum price         |Numeric  | null: false |
| Sokketsu price        |Numeric  |             |
| Stock qty             |Numeric  | null: false |


  belongs_to :user
  belongs_to :user



# テーブル設計 table :stock 

| Column                | Type    | Options     |
| ------------------    | ------  | ----------- |
| Item number           | text    | null: false |
| Item name             | text    | null: false |
| stock qty             |Numeric  | null: false |
| user id               |references| null: false, foregin_key |


  belongs_to :item
  belongs_to :user



# テーブル設計 table :order 

| Column             | Type     | Options     |
| ------------------ | ------   | ----------- |
| Order numbers      | text     | null: false |
| Delivery date      | date     | null: false |
| Delivery time      |timestamp |             |
| Payment method     | text     |             |
| user id            |references|             |

  belongs_to :auction


# テーブル設計 table :auction 

| Column                | Type    | Options     |
| ------------------    | ------  | ----------- |
| Bidder's names        | text    | null: false |
| Bidder's prices       |Numeric  | null: false |
| Winning bidder's name | text    | null: false |
| Bidded price          |Numeric  | null: false |
| Winning bidder's id   |reference| null: false, foregin_key |

  belongs_to :item
  belongs_to :user

