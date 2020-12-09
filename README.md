# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| email     | string | null: false, unique: true |
| password  | string | null: false               |
| name      | string | null: false               |

### Association

- has_many :items
- has_many :purchase_records
- has_one :destination_address

## Items テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| description| text       | null: false                    |
| status     | string     | null: false                    |
| price      | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

- has_one :purchase_record
- belongs_to :users


## Destination_address テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| family_name      | string      | null: false                    |
| first_name       | string      | null: false                    |
| family_name_kana | string      | null: false                    |
| first_name_kana  | string      | null: false                    |
| post_code        | string      | null: false                    |
| prefecture       | string      | null: false                    |
| city             | string      | null: false                    |
| adress           | string      | null: false                    |
| user_id          | string      | null: false, foreign_key: true |

### Association

- belongs_to :user

## Purchase_records テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item