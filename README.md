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
| last name_full-width       | string | null: false              |
| first name_full-width      | string | null: false              |
| last name_kana_full-width  | string | null: false              |
| first name_kana_full-width | string | null: false              |
| birthday                   | date | null: false                |



### Association

has_many :items
has_many :purchases

### items テーブル

| items              | Type       | Options          |
| ------------------ | -----------| -----------------|
| name               | string     | null: false      |
| description        | text       | null: false      |
| category           | integer    | null: false      |
| condition_id       | integer    | null: false      |
| delivery charge_id | integer    | null: false      |
| delivery source_id | integer    | null: false      |
| shipping days_id   | integer    | null: false      |
| price              | integer    | null: false      |
| user               | references | foreign_key: true|

### Association

has_one  :users

## purchase テーブル

| purchase              | Type       | Options     |
| --------------------- | -----------| ----------- |
| user                  | references |             |
| items                 | references |             |

### Association

has_one :users
has_one :shipping address
has_many :items  

## purchase テーブル

| shipping address      | Type       | Options     |
| --------------------- | -----------| ----------- |
| postal code           | string     | null: false |
| delivery source_id    | integer    | null: false |
| municipalities        | string     | null: false |
| address               | string     | null: false |
| building name         | string     |             |
| phone number          | string     | null: false |
| purchase              | references |             |

### Association

belongs_to  :purchase