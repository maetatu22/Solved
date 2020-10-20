# アプリ名

## Solved

## アプリケーション紹介

 非同期通信を利用したチャットでやりとりしながら悩みを解決できる、お悩み解決アプリです。

## 実装機能

* ユーザー管理機能(gem:devise)
* ユーザープロフィールページ詳細・編集機能
* SNS(Twitter, Facebook)アカウントでサインアップ/ログイン
* お悩み新規投稿・詳細・編集・削除機能
* 投稿一覧表示・ユーザー個別投稿一覧表示機能
* 検索機能
* エラー文日本語表示機能
* 画像プレビュー機能
* コメント機能(非同期)
* ベストアンサー選択機能

## 本番環境 (デプロイ先とテストアカウント & ID) 

* [GitHub](https://github.com/maetatu22/Solved) 
* [デプロイ先](http://46.51.237.161/)
* テストアカウント :Email: testtest@gmail.com / Password: test1234
* テストアカウント2:Email: testtest2@gmail.com / Password: test1234

## DEMO

## トップ画面

[![Image from Gyazo](https://i.gyazo.com/c5dc0b94b3ae5b4d0fab2d0f7666a7cf.png)](https://gyazo.com/c5dc0b94b3ae5b4d0fab2d0f7666a7cf)


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

