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
| encrypted_password | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :purchase_info


## items テーブル
| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| category_id      | integer    | null: false                     |
| product_name     | string     | null: false                     |
| product_info     | text       | null: false                     |
| price            | integer    | null: false                     |
| condition_id     | integer    | null: false                     |
| postage_type_id  | integer    | null: false                     |
| prefectures_id   | integer    | null: false                     |
| delivery_days_id | integer    | null: false                     |
| user             | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :purchase_info
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage_type
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :delivery_days

## purchase_infoテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :sipping_address

## sipping_addressテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| purchase_info  | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_info
- belongs_to_active_hash :prefectures