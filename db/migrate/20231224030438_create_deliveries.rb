class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.string       :post_code,     null: false
      t.integer      :prefecture_id, null: false
      t.city         :string,        null: false
      t.address      :string,        null: false
      t.building     :string
      t.phone_number :string,        null: false
      t.order        :references,    null: false, foreign_keys: true
      t.timestamps
    end
  end
end
