FactoryBot.define do
  factory :item do
    name {Faker::Food.name}
    detail {Faker::Food.description}
    size {Faker::Number.digit}
    delivery_charge {Faker::Number.digit}
    delivery_prefecture {Faker::Number.digit}
    delivery_time {Faker::Number.digit}
    delivery_way {Faker::Number.digit}
    price {Faker::Number.number(7)}
    state {Faker::Number.digit}
    large_category {Faker::Number.digit}
    middle_category {Faker::Number.digit}
    small_category {Faker::Number.digit}
    brand{Faker::Name.first_name}
    after(:build) do |item|
      create_list(:image , 10, item: item)
    end
  end
end
