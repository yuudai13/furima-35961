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

| users                      | Type   | Options     |
| ---------------------------| ------ | ----------- |
| nickname                   | string | null: false |
| email                      | string | null: false |
| encrypted_password         | string | null: false |
| last name_full-width       | string | null: false |
| first name_full-width      | string | null: false |
| last name_kana_full-width  | string | null: false |
| first name_kana_full-width | string | null: false |
| birthday year              | string | null: false |
| birthday month             | string | null: false |
| birthday date              | string | null: false |

### Association

has_many :items
has_many :purchase

### items テーブル

| items              | Type       | Options       |
| ------------------ | -----------| ----------- |
| image              | image      | null: false |
| name               | string     | null: false |
| description        | text       | null: false |
| category           | integer    | null: false |
| condition          | integer    | null: false |
| delivery charge    | integer    | null: false |
| delivery source    | integer    | null: false |
| shipping days      | integer    | null: false |
| price              | string     | null: false |
| user               | references |             |

### Association

has_one  :users

## purchase テーブル

| purchase              | Type       | Options     |
| --------------------- | -----------| ----------- |
| credit card           | integer    | null: false |
| expiration date month | integer    | null: false |
| expiration date year  | integer    | null: false |
| security code         | integer    | null: false |
| user                  | references |             |

### Association

has_one :users
has_one :purchase  

## purchase テーブル

| shipping address      | Type       | Options     |
| --------------------- | -----------| ----------- |
| postal code           | integer    | null: false |
| prefectures           | integer    | null: false |
| municipalities        | string     | null: false |
| address               | string     | null: false |
| building name         | string     | null: false |
| phone number          | integer    | null: false |
| purchase              | references |             |

### Association

belongs_to  :purchase