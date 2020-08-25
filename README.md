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
| --------        | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false, unique: true, index:true |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday_year   | date   | null: false |
| birthday_month  | date   | null: false |
| birthday_day    | date   | null: false |


### Association

- has_many :items
- has_one :Purchase_destination
- has_one :credit_card

## Purchase_destination テーブル

| Column          | Type   | Options     |
| ------          | ------ | ----------- |
| postal code     | integer | null: false |
| prefecture      | string | null: false |
| city            | string | null: false |
| house number    | string | null: false |
| building name   | string |             |
| phone number    | integer | unique:true |

### Association

- belongs_to :user
- Gem：prefecture

## credit card テーブル

| Column                    | Type    | Options     |
| ------                    | ------  | ----------- |
| card number               | integer | null:false, unique: true |
| expiration data_year      | integer | null: false |
| expiration data_month     | integer | null: false |
| security code             | integer | null: false |


### Association

- belongs_to :user

## items テーブル

| Column               | Type       | Options                        |
| -------              | ---------- | ------------------------------ |
| Product name         | string     | null: false |
| item img             | references | null: false, foreign_key: true |
| price                | integer    | null: false |
| Product description  | string     | null: false |
| exhibitor            | string     | null: false |
| category             | string     | null: false |
| Product status       | string     | null: false |
| Delivery fee         | string     | null: false |
| Shipping orign       | string     | null: false |
| Shipping data        | string     | null: false |


### Association

- has_many : items
- Gem：prefecture