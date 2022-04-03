# README

<div style="text-align: center;">

# FURIMA
</div>

- 日本のECサイトのクローンサイトです
[![Image from Gyazo](https://i.gyazo.com/eb6a4bf98980b9df9423bae4ad4d6af1.jpg)](https://gyazo.com/eb6a4bf98980b9df9423bae4ad4d6af1)
## 機能
- 新規会員登録・ログインすると商品の購入、出品ができます
- 新規会員登録後、ログインがお済みでない方も商品の一覧、詳細を閲覧可能です
- 決済方法はご自身のクレジットカードを登録して購入できます

## URL
https://furima-35656.herokuapp.com/

## 言語
- Ruby 2.6.5

## フレームワーク
- Ruby on Rails 6.0

## データベース
- MySQL 

## インフラストラクチャ
- AWS EC2
- AWS S3

## DB設計
## ER図
[![Image from Gyazo](https://i.gyazo.com/53e4f89b59230d3d5b4b99899236825d.png)](https://gyazo.com/53e4f89b59230d3d5b4b99899236825d)

## テーブル設計

### users テーブル
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

#### Association

- has_many :items
- has_many :purchase_info


### items テーブル
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

#### Association

- belongs_to :user
- has_one :purchase_info
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage_type
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :delivery_days

### purchase_infoテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

### shipping_addressesテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| purchase_info  | references | null: false, foreign_key: true |

#### Association

- belongs_to :purchase_info
- belongs_to_active_hash :prefectures