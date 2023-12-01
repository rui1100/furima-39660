## users テーブル

| Column | Type | Options |
| ------------------ | ------ | ---------- |
| nickname           | string | null:false |
| email              | string | null:false |
| encrypted_password | string | null:false |
| name_full_width    | string | null:false |
| kana_full_width    | string | null:false |
| date_birth         | string | null:false |

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
| name            | string     | null:false                    |
| describe        | text       | null:false                    |
| category        | string     | null:false                    |
| status          | string     | null:false                    |
| price           | string     | null:false                    |
| commission      | string     | null:false                    |
| profit          | string     | null:false                    |
| user            | references | null:false, foreign_key: true |

### Association
- belong_to :user
- has_many  :comments
- has_one   :order
- has_one   :delivery



## orders テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| name    | string     | null:false                    |
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
| building       | string     | null:false                     |
| phone_number    | string     | null:false                     |
| order          | references | null:false, foreign_keys: true |
| item           | references | null:false, foreign_keys: true |

### Association
- belongs_to :item
- belongs_to :order
