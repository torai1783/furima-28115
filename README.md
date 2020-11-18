# テーブル設計

## users テーブル

| Column             | Type   | Option      |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name_jp            | string | null: false |
| neme_kana          | string | null: false |
| birthday           | string | null: false |


### Association
- has_many :items
- has_many :users_items
- has_many :users, through: users_items

## items テーブル

| Column          | Type      | Option            |
| --------------- | --------- | ----------------- |
| user_id         | reference | foreign_key: true |
| itemname        | string    | null: false       |
| price           | integer   | null: false       |
| description     | integer   | null: false       |
| category        | integer   | null: false       |
| status          | integer   | null: false       |
| charges         | integer   | null: false       |
| deliverysource  | integer   | null: false       |
| deliverydays    | integer   | null: false       |

### Association

- has_many :users_items
- belongs_to :user

## users_items　テーブル

| Column  | Type      | Option            |
| ------- | --------- | ----------------- |
| user    | reference | foreign_key: true |
| item    | reference | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## buyers　テーブル

| Column         | Type       | Option            |
| -------------- |----------- | ----------------- |
| users_items    | reference  | foreign_key: true |
| postalcood     | string     | null: false       |
| prefecture     | string     | null: false       |
| municipality   | string     | null: false       |
| address        | string     | null: false       |
| building       | string     |                   |

### Association

- belongs_to :users_items


