## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null:false               |
| email              | string | null:false, unique: true |
| encrypted_password | string | null:false               |
| first_name         | string | null:false               |
| last_name          | string | null:false               |
| first_name_kana    | string | null:false               |
| last_name_kana     | string | null:false               |
| date_birth         | date   | null:false               |

### Association
- has_many :items
- has_many :comments
- has_many :orders



## comments テーブル

| Column   | Type       | Options                       |
| -------- | ---------- | ----------------------------- |
| content  | text       | null:false                    |
| user     | references | null:false, foreign_key: true |
| item     | references | null:false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item



## items テーブル

| Column          | Type | Options |
| --------------- | ---------- | ----------------------------- |
| image           | text       | null:false                    |
| name            | string     | null:false                    |
| describe        | text       | null:false                    |
| category        | integer    | null:false                    |
| status          | integer    | null:false                    |
| delivery_charge | integer    | null:false                    |
| region          | integer    | null:false                    |
| shipping_day    | integer    | null:false                    |
| price           | string     | null:false                    |
| commission      | string     | null:false                    |
| profit          | string     | null:false                    |
| user            | references | null:false, foreign_key: true |

### Association
- belong_to :user
- has_many  :comments
- has_one   :order



## orders テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| user    | references | null:false, foreign_key: true |
| item    | references | null:false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :delivery



## deliveries テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null:false                     |
| prefecture     | string     | null:false                     |
| city           | string     | null:false                     |
| address        | string     | null:false                     |
| building       | string     |                                |
| phone_number   | string     | null:false                     |
| order          | references | null:false, foreign_keys: true |

### Association
- belongs_to :order
