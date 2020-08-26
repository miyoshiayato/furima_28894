# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false, unique: true, index:true |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date   | null: false |



### Association

- has_many :items
- has_one :Purchase_destination

## Purchase_destination テーブル

| Column          | Type    | Options                         |
| --------------- | ------  | ------------------------------- |
| postal_code     | integer | null: false                     |
| prefecture      | integer | null: false, foreign_key: true |
| city            | string  | null: false                     |
| house_number    | string  | null: false                     |
| building_name   | string  |                                 |
| phone_number    | integer | unique:true                     |

### Association

- belongs_to :users



## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| Product_name         | string     | null: false                    |
| item_img             | references | null: false, foreign_key: true |
| price                | integer    | null: false                    |
| Product_description  | string     | null: false                    |
| user_id              | string     | null: false, foreign_key: true |
| category             | integer    | null: false                    |
| Product_status       | integer    | null: false, foreign_key: true |
| Delivery_fee         | integer    | null: false, foreign_key: true |
| Shipping_area        | integer    | null: false, foreign_key: true |
| Shipping_data        | integer    | null: false, foreign_key: true |


### Association

- belongs_to : users



## Purchase_id テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| user_id        | integer | null: false, foreign_key: true |
| item_id        | integer | null: false, foreign_key: true |


### Association

- belongs_to : items
- has_many : users