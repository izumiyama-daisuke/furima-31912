# README

## usersテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| nickname    | string     | null: false                    |
| email       | string     | null: false                    |
| password    | string     | null: false                    |
| first_name  | string     | null: false                    |
| last_name   | string     | null: false                    |
| first_kana  | string     | null: false                    |
| last_kana   | string     | null: false                    |
| barthday    | date       | null: false                    |

### Association
- has_many :items
- has_many :Purchase_recodes


## itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| item_explanation  | text       | null: false                    |
| category          | string     | null: false                    |
| state             | text       | null: false                    |
| delivery_fee      | string     | null: false                    |
| days              | integer    | null: false                    |
| selling_price     | integer    | null: false                    |
| user_id           | references | foreign_key: true              |

### Association
- belongs_to :user
- has_many :Purchase_recodes
- has_one :Shipping_address



## Purchase_recodeテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_id           | references | null: false, foreign_key: true |
| item_id           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item



## Shipping_addressテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| postal_code       | integer    | null: false                    |
| prefectures       | text       | null: false                    |
| municipality      | text       | null: false                    |
| address           | text       | null: false                    |
| telephone_number  | integer    | null: false                    |

### Association
- belongs_to :item