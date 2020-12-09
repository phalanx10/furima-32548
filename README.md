# テーブル設計

## users テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| email              | string      | null: false, unique: true      |
| encrypted_password | string      | null: false                    |
| name               | string      | null: false                    |
| family_name        | string      | null: false                    |
| first_name         | string      | null: false                    |
| family_name_kana   | string      | null: false                    |
| first_name_kana    | string      | null: false                    |
| birthday           | date        | null: false                    |

### Association

- has_many :items
- has_one :purchase_records

## Items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| price            | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| delivery_days_id | integer    | null: false                    |
| Shipping_area_id | integer    | null: false                    |
| delivery fee_id  | integer    | null: false                    |
| categories_id    | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

- has_one :purchase_record
- belongs_to :user


## Destination_addresses テーブル

| Column                 | Type        | Options                        |
| ---------------------- | ----------- | ------------------------------ |
| post_code              | string      | null: false                    |
| prefecture             | string      | null: false                    |
| city                   | string      | null: false                    |
| address                | string      | null: false                    |
| building_name          | integer     | null: false                    |
| phone_number           | integer     | null: false                    |
| purchase_record_id     | references  | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record

## Purchase_records テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| item_id                    | references | null: false, foreign_key: true |
| user_id                    | references | null: false, foreign_key: true |

### Association

- has_one :destination_address
- belongs_to :item
- belongs_to :user