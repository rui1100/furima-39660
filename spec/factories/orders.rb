FactoryBot.define do
  factory :order do
    post_code { '123-4567' }
    prefecture { Prefecture.where.not(id: 1).sample }
    city { 'Sample City' }
    address { '123 Sample Street' }
    building { 'Sample Building' }
    phone_number { '090012345678' }
  end
end
