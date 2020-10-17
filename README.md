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

