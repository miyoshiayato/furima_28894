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
| email           | string | null: false, unique: true |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date   | null: false |



### Association

- has_many : items
- has_many : purchases

## Address テーブル

| Column          | Type    | Options                         |
| --------------- | ------  | ------------------------------- |
| postal_code     | string  | null: false                     |
| Prefecture      | integer | null: false                     |
| city            | string  | null: false                     |
| house_number    | string  | null: false                     |
| building_name   | string  |                                 |
| phone_number    | string  | null: false                     |
| purchase_id     | integer | null: false, foreign_key:true   |


### Association
belongs_to : purchase




## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| product_name         | string     | null: false                    |
| price                | integer    | null: false                    |
| product_description  | integer    | null: false                    |
| user_id              | integer    | null: false, foreign_key: true |
| Category             | integer    | null: false                    |
| ProductStatus        | integer    | null: false,                   |
| DeliveryFee          | integer    | null: false,                   |
| ShippingArea         | integer    | null: false,                   |
| ShippingData         | integer    | null: false,                   |


### Association

- belongs_to : user
- has_one : purchase


## purchase テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| user_id        | integer | null: false, foreign_key: true |
| item_id        | integer | null: false, foreign_key: true |


### Association

- belongs_to : item
- belongs_to : user
- has_one : order