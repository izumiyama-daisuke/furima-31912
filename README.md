# README

## usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| password           | string     | null: false                    |
| encrypted_password | string     | null: false                    |

### Association
- has_many :items
- has_many :buys
- has_one :profile


## profilesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_kana         | string     | null: false                    |
| last_kana          | string     | null: false                    |
| birth_year         | integer    | null: false                    |
| birth_month        | integer    | null: false                    |
| birth_day          | integer    | null: false                    |

### Association
- belongs_to :user


## itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| description       | text       | null: false                    |
| category_id       | integer    | null: false                    |
| state_id          | integer    | null: false                    |
| delivery_fee_id   | integer    | null: false                    |
| shipping_area_id  | integer    | null: false                    |
| days_id           | integer    | null: false                    |
| selling_price     | integer    | null: false                    |
| user              | references | foreign_key: true              |

### Association
- belongs_to :user
- has_one :Transaction



## Transactionsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

### Association
- belongs_to :buy
- belongs_to :item



## Buysテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| postal_code       | integer    | null: false                    |郵便番号
| prefectures       | text       | null: false                    |都道府県
| city              | text       | null: false                    |市町村
| address1          | text       | null: false                    |番地
| address2          | text       |                                |建物名
| telephone         | integer    | null: false, unique: true      |電話番号

### Association
- belongs_to :user
- has_one :Transaction