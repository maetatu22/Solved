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

## トップ画面(お悩み投稿一覧表示画面)

[![Image from Gyazo](https://i.gyazo.com/614015edfae80d595de40ae53f593419.png)](https://gyazo.com/614015edfae80d595de40ae53f593419)

## ログイン画面

[![Image from Gyazo](https://i.gyazo.com/52b4a8bcb92956a77398b8332fdf41b5.png)](https://gyazo.com/52b4a8bcb92956a77398b8332fdf41b5)

## 新規登録画面

[![Image from Gyazo](https://i.gyazo.com/4b64e1d8504e17b91674918370996af2.png)](https://gyazo.com/4b64e1d8504e17b91674918370996af2)
[![Image from Gyazo](https://i.gyazo.com/f1b8dd400a24ebec7eb110cddc07e229.png)](https://gyazo.com/f1b8dd400a24ebec7eb110cddc07e229)

 ## お悩み投稿画面

 [![Image from Gyazo](https://i.gyazo.com/642141c0e3421015b46c36dc39c93bbd.png)](https://gyazo.com/642141c0e3421015b46c36dc39c93bbd)
 [![Image from Gyazo](https://i.gyazo.com/fb1b4227ce1a56e49031561f97bc64ee.png)](https://gyazo.com/fb1b4227ce1a56e49031561f97bc64ee)


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

