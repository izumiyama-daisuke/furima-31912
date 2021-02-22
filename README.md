# README

## usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_kana         | string     | null: false                    |
| last_kana          | string     | null: false                    |
| birthday           | date       | null: false                    |

### Association
- has_many :items
- has_many :orders




## itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |商品名
| description       | text       | null: false                    |説明
| category_id       | integer    | null: false                    |分類   (ActiveHash)
| state_id          | integer    | null: false                    |状態   (ActiveHash)
| delivery_fee_id   | integer    | null: false                    |手数料 (ActiveHash)
| prefecture_id     | integer    | null: false                    |発送地 (ActiveHash)
| day_id            | integer    | null: false                    |      (ActiveHash)
| price             | integer    | null: false                    |値段
| user              | references | null: false,foreign_key: true  |出品者

### Association
- belongs_to :user
- has_one :order




## Ordersテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |購入者
| item              | references | null: false, foreign_key: true |購入品

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## Addressテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| postal_code       | string     | null: false                    |郵便番号
| prefecture_id     | integer    | null: false                    |都道府県(ActiveHash)
| city              | string     | null: false                    |市町村
| address1          | string     | null: false                    |番地
| address2          | string     |                                |建物名
| telephone         | string     | null: false,                   |電話番号
| order              | references | null: false, foreign_key: true |

### Association
- belongs_to :order
