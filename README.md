# テーブル設計

## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_year         | integer | null: false               |
| birth_month        | integer | null: false               |
| birth_day          | integer | null: false               |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item_name             | string     | null: false                    |
| item_info             | text       | null: false                    |
| item_category_id      | integer    | null: false                    |
| item_status_id        | integer    | null: false                    |
| item_ship_fee_id      | integer    | null: false                    |
| item_ship_area_id     | integer    | null: false                    |
| item_ship_schedule_id | integer    | null: false                    |
| item_price            | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| ship_postal_code   | string     | null: false                    |
| ship_prefecture_id | integer    | null: false                    |
| ship_city          | string     | null: false                    |
| ship_address       | string     | null: false                    |
| ship_build_name    | string     |                                |
| ship_phone_number  | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item