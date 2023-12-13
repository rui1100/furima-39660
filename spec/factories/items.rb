FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    category { Category.where.not(id: 1).sample }
    status { Status.where.not(id: 1).sample }
    postage { Postage.where.not(id: 1).sample }
    prefecture { Prefecture.where.not(id: 1).sample }
    day { Day.where.not(id: 1).sample }
    price { Faker::Commerce.price(range: 300..9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
