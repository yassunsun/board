# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :topic_users
- has_many :topics, through: topic_users
- has_many :posts

## topics テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title  | string | null: false |

### Association

- has_many :topic_users
- has_many :users, through: topic_users
- has_many :posts

## topic_users テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| topic  | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :topic

## posts テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| comment | text       | null: false       |
| user    | references | foreign_key: true |
| room    | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :topic