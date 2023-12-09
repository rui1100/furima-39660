FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    category { Category.all.sample }
    status { Status.all.sample }
    postage { Postage.all.sample }
    prefecture { Prefecture.all.sample }
    day { Day.all.sample }
    price { Faker::Commerce.price(range: 300..9999999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
