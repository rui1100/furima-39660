FactoryBot.define do
  factory :order_form do
    post_code { '123-4567' }
    prefecture_id { Prefecture.where.not(id: 1).sample }
    city { 'Sample City' }
    address { '123 Sample Street' }
    building { 'Sample Building' }
    phone_number { '090012345678' }

    association :user
    association :item
  end
end
