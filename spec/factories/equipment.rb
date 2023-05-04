FactoryBot.define do
    factory :equipment do
        name { Faker::Lorem.sentence } # the names can be long
        description { Faker::Lorem.paragraph }
        location { Faker::Address.full_address }
        SN { Faker::Number.unique.hexadecimal(digits: 10) }
        MN { Faker::Number.unique.hexadecimal(digits: 6) }
        lastpm { Faker::Date.between(from: 10.years.ago, to: Date.today) }
    end
  end