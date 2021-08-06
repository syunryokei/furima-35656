# README

# テーブル設計

## users テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| read_family        | string  | null: false               |
| read_first         | string  | null: false               |
| nick_name          | string  | null: false               |
| email              | string  | null: false, unique: true |
| password           | string  | null: false               |
| encrypted_password | string  | null: false               |
| birth_year         | integer | null: false               |
| birth_month        | integer | null: false               |
| birth_day          | integer | null: false               |

### Association

- has_many :items
- has_many :transaction
- has_many :comments
- has_many :purchase_info


## items テーブル
| Column          | Type    | Options                         |
| --------------- | ------- | ------------------------------- |
| product_name    | string  | null: false                     |
| product_info    | text    | null: false                     |
| price           | string  | null: false                     |
| image           | text    | null: false                     |
| postage_type_id | integer | null: false                     |
| state_id        | integer | null: false                     |
| prefectures_id  | integer | null: false                     |
| category_id     | integer | null: false                     |
| seller_id       | integer | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :transaction
- has_many :comments
- belongs_to_active_hash :category
- belongs_to_active_hash :postage_type
- belongs_to_active_hash :state
- belongs_to_active_hash :prefectures
- belongs_to :seller, class_name: "User", :foreign_key => "seller_id"

## transactionテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| buyer_id      | integer    | null: false, foreign_key: true |
| seller_id     | integer    | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
| purchase_info | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one :purchase_info
- belongs_to :buyer, class_name: "User", :foreign_key => "buyer_id"
- belongs_to :seller, class_name: "User", :foreign_key => "seller_id"

## purchase_infoテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     | null: false                    |
| phone_number   | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :transaction
- belongs_to_active_hash :prefectures