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

| users                      | Type   | Options                  |
| ---------------------------| ------ | -----------              |
| nickname                   | string | null: false              |
| email                      | string | null: false unique: true |
| encrypted_password         | string | null: false              |
| last_name_full_width       | string | null: false              |
| first_name_full_width      | string | null: false              |
| last_name_kana_full_width  | string | null: false              |
| first_name_kana_full_width | string | null: false              |
| birthday                   | date | null: false                |



### Association

has_many :items
has_many :purchases

### items テーブル

| items              | Type       | Options          |
| ------------------ | -----------| -----------------|
| name               | string     | null: false      |
| description        | text       | null: false      |
| category_id        | integer    | null: false      |
| condition_id       | integer    | null: false      |
| delivery_charge_id | integer    | null: false      |
| delivery_source_id | integer    | null: false      |
| shipping_days_id   | integer    | null: false      |
| price              | integer    | null: false      |
| user               | references | foreign_key: true|

### Association

belongs_to :user
has_one :purchase

## purchases

| purchase              | Type       | Options           |
| --------------------- | -----------| ----------------- |
| user                  | references | foreign_key: true |
| item                  | references | foreign_key: true |

### Association

belongs_to :user
has_one :shipping_address
belongs_to :item

## shipping_address テーブル

| shipping_address      | Type       | Options           |
| --------------------- | -----------| ------------------|
| postal_code           | string     | null: false       |
| delivery_source_id    | integer    | null: false       |
| municipalities        | string     | null: false       |
| address               | string     | null: false       |
| building_name         | string     |                   |
| phone_number          | string     | null: false       |
| purchase              | references | foreign_key: true |

### Association

belongs_to  :purchase