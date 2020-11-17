# テーブル設計

## users テーブル

| Column   | Type   | Option      |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| birthday | string | null: false |

### Association

- has_many :users_items
- has_many :users, through: users_items

## items テーブル

| Column          | Type   | Option      |
| --------------- | ------ | ----------- |
| user_id         | string | null: false |
| itemname        | string | null: false |
| category        | string | null: false |
| status          | string | null: false |
| charges         | string | null: false |
| deliverysource  | string | null: false |
| deliverydays    | string | null: false |

### Association

- has_many :users_items
- has_many :items, through: users_items

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
| user           | reference  | foreign_key: true |
| item           | reference  | foreign_key: true |
| cardnumber     | string     | null: false       |
| expirationdate | string     | null: false       |
| securitycood   | string     | null: false       |
| postalcood     | string     | null: false       |
| municipality   | string     | null: false       |
| address        | string     | null: false       |
| building       | string     | null: false       |

### Association

- belongs_to :user
- belongs_to :item


