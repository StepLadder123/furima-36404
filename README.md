# テーブル設計

## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_info          | text       | null: false                    |
| item_category      | string     | null: false                    |
| item_status        | string     | null: false                    |
| item_ship_fee      | string     | null: false                    |
| item_ship_area     | string     | null: false                    |
| item_ship_schedule | string     | null: false                    |
| item_price         | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| card_number       | string     | null: false                    |
| card_exp_month    | integer    | null: false                    |
| card_exp_year     | integer    | null: false                    |
| card_cvc          | string     | null: false                    |
| ship_postal_code  | string     | null: false                    |
| ship_prefecture   | string     | null: false                    |
| ship_city         | string     | null: false                    |
| ship_address      | text       | null: false                    |
| ship_build_name   | text       |                                |
| ship_phone_number | string     | null: false                    |
| user_id           | references | null: false, foreign_key: true |
| item_id           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item