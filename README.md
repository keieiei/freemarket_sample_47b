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


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|profile|text|-------|
|created_at|datetime|null: false|

### Association

- has_many :credit_cards
- has_one :receiver_information
- has_many :sender_evaluations, class_name: 'Evaluation', foreign_key: 'sender_id'
- has_many :receiver_evaluations, class_name: 'Evaluation', foreign_key: 'receiver_id'
- has_many :seller_items, class_name: 'Item', foreign_key: 'seller_id'
- has_many :buyer_items, class_name: 'Item', foreign_key: 'buyer_id'
- has_many :nices
- has_many :item_reports
- has_many :comments
- has_many :item_comments
- has_many :notifications, thorough: :user_notifications
- has_many :user_notifications


## notificationsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|url|string|null: false|
|created_at|datetime|null: false|

### Association
- has_many :users, thorough: :user_notifications
- has_many :user_notifications


## user_notificationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|notification_id|integer|null: false|

### Association
- belongs_to :user
- belongs_to :notification


## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer :bigint, limit:8|null: false, unique: true|
|valid_year|integer|-------|
|valid_month|integer|-------|
|security_code|integer|-------|
|user_id|integer|null: false|


### Association

- belongs_to :user


## receiver_informationsテーブル

|Column|Type|Options|
|------|----|-------|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|string|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|street|string|null: false|
|building|string|-------|
|phone_number|string|-------|
|user_id|string|null: false, unique: true|


### Association

- belongs_to :user


## evaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|state|integer|null: false|
|sender_state|integer|null: false|
|comment|text|-------|
|created_at|datetime|null: false|
|sender_id|integer|null: false|
|receiver_id|integer|null: false|


### Association

- belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
- belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text|null: false|
|large_category_id|integer|null: false|
|middle_category_id|integer|null: false|
|small_category_id|integer|-------|
|size|integer|null: false|
|brand_id|integer|-------|
|condition|integer|null: false|
|deliverly_charge|integer|null: false|
|deliverly_prefecture|integer|null: false|
|delivery_time|integer|null: false|
|price|integer|null: false|
|created_at|datetime|null: false|
|state|integer|null: false|
|seller_id|integer|null: false|
|buyer_id|integer|null: false|


### Association

- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
- belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
- belongs_to :large_category
- belongs_to :middle_category
- belongs_to :small_category
- belongs_to :brand
- has_many :images
- has_many :nices
- has_many :item_reports
- has_many :comments


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false|


### Association

- belongs_to :item


## large_categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


### Association

- has_many :items
- has_many :middle_categorys


## middle_categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|large_category_id|integer|null: false|


### Association

- has_many :items
- has_many :small_categorys
- belongs_to :large_category


## small_categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|middle_category_id|integer|null: false|


### Association

- has_many :items
- belongs_to :middle_category


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


### Association

- has_many :items


## nicesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false|
|user_id|integer|null: false|


### Association

- belongs_to :item
- belongs_to :user


## item_reportsテーブル

|Column|Type|Options|
|------|----|-------|
|created_at|datetime|null: false|
|item_id|integer|null: false|
|user_id|integer|null: false|


### Association

- belongs_to :item
- belongs_to :user


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|item_id|integer|null: false|
|user_id|integer|null: false|


### Association

- has_many :comment_reports
- belongs_to :item
- belongs_to :user


## comment_reportsテーブル

|Column|Type|Options|
|------|----|-------|
|created_at|datetime|null: false|
|comment_id|integer|null: false|
|user_id|integer|null: false|

### Association

- belongs_to :comment
- belongs_to :user
