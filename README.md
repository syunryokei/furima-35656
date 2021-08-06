# README

# テーブル設計

## users テーブル
| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| family_name | string | null: false |
| read_family | string | null: false |
| read_first  | string | null: false |
| nick_name   | string | null: false |
| email       | string | null: false |
| password    | string | null: false |

### Association

- has_many :items
- has_many :transaction
- has_many :comments
- has_many :purchase_info


## items テーブル
| Column       | Type       | Options                         |
| ------------ | ---------- | ------------------------------- |
| product_name | string     | null: false                     |
| product_info | string     | null: false                     |
| price        | string     | null: false                     |
| image        | text       | null: false                     |
| postage_type | integer    | null: false                     |
| state        | integer    | null: false                     |
| prefectures  | integer    | null: false                     |
| category     | integer    | null: false                     |
| seller       | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :transaction
- has_many :comments
- belongs_to_active_hash :category
- belongs_to_active_hash :postage_type
- belongs_to_active_hash :state
- belongs_to_active_hash :prefectures
- belongs_to :seller, class_name: "User"

## transactionテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| buyer            | references | null: false, foreign_key: true |
| seller           | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |
| purchase_info_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one :purchase_info
- belongs_to :buyer, class_name: "User"
- belongs_to :seller, class_name: "User"

## purchase_infoテーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| phone_number | string     | null: false                    |
| prefectures  | integer    | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :transaction
- belongs_to_active_hash :prefectures