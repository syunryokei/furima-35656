# README

# テーブル設計

## users テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| read_family        | string  | null: false               |
| read_first         | string  | null: false               |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| password           | string  | null: false               |
| birthday           | integer | null: false               |

### Association

- has_many :items
- has_many :transaction
- has_many :comments


## items テーブル
| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| product_name    | string     | null: false                     |
| product_info    | text       | null: false                     |
| price           | integer    | null: false                     |
| postage_type_id | integer    | null: false                     |
| state_id        | integer    | null: false                     |
| prefectures_id  | integer    | null: false                     |
| category_id     | integer    | null: false                     |
| user            | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :transaction
- has_many :comments
- belongs_to_active_hash :category
- belongs_to_active_hash :postage_type
- belongs_to_active_hash :state
- belongs_to_active_hash :prefectures

## transactionテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one :purchase_info

## purchase_infoテーブル
| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| postal_code    | string  | null: false                    |
| prefectures_id | integer | null: false                    |
| city           | string  | null: false                    |
| address        | string  | null: false                    |
| building_name  | string  |                                |
| phone_number   | string  | null: false                    |
| name           | string  | null: false                    |
| transaction    | string  | null: false, foreign_key: true |

### Association

- belongs_to :transaction
- belongs_to_active_hash :prefectures