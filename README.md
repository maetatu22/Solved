# アプリ名

## Solved

## アプリケーション紹介

 非同期通信を利用したチャットでやりとりしながら悩みを解決できる、お悩み解決アプリです。

# 接続先情報
 >* http://46.51.237.161/

 >>aaaaa

# テーブル設計

## usersテーブル

| Column            | Type               | Options                       |
| ----------------- | ------------------ | ----------------------------- |
| email             | string             |  null: false, uniqueness: true|
| encrypted_password| string             |  null: false                  |
| name              | string             |  null: false                  |
| self_introduction | text               |  null: false                  |
| gender_id         | integer            |  null: false                  |
| birthday          | data               |  null: false                  |   

### Association

- has_many :problems
- has_many :comments
- has_many :sns_credentials
- belongs_to_active_hash :gender
- has_many :best_users

## problemsテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| title         | string     | null: false       |
| text          | string     | null: false       |
| genre_id      | integer    | null: false       |
| user          | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- belongs_to_active_hash :genre
- has_one :solved_worries
- has_one :best_user

## commentsテーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| comment            | text       | null: false       |
| checked            | boolean    |                   |
| user               | references | foreign_key: true |
| problem            | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :problem

## sns_credentialsテーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| provider           | string     |                   |
| uid                | string     |                   |
| user               | references | foreign_key: true |

### Association

- belongs_to :user

## solved_worriesテーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| problem            | references | foreign_key: true |

### Association

- belongs_to :problem

## best_usersテーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| user               | references | foreign_key: true |
| problem            | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :problem

