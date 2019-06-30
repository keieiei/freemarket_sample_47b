FactoryBot.define do
  name = Gimei.name
  prefecture = I18n.t('prefecture')[Faker::Number.between(0, 47)]

  factory :receiver_information do
    family_name           { name.last.kanji }
    first_name            { name.first.kanji }
    family_name_kana      { name.last.katakana }
    first_name_kana       { name.first.katakana }
    postal_code           { Faker::Address.postcode }
    prefecture            { prefecture }
    city                  { Gimei.address.city.kanji }
    street                { Gimei.address.town.kanji }
    building              { Faker::Address.building_number }
    phone_number          { Faker::PhoneNumber.cell_phone }
    user
  end

end
