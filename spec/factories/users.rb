FactoryBot.define do
  pass = Faker::Internet.password(6)
  name = Gimei.name
  day = Faker::Time.between(100.years.ago, Date.today, :all)

  factory :user do
    nickname              { Faker::JapaneseMedia::SwordArtOnline.game_name }
    email                 { Faker::Internet.email }
    password              { pass }
    password_confirmation { pass }
    profile               { Faker::Lorem.sentence }
    icon                  { File.open("#{Rails.root}/spec/image/test_image.jpg") }
    family_name           { name.last.kanji }
    first_name            { name.first.kanji }
    family_name_kana      { name.last.katakana }
    first_name_kana       { name.first.katakana }
    birth_year            { day.to_s[0, 4].to_i }
    birth_month           { day.to_s[5, 2].to_i }
    birth_day             { day.to_s[8, 2].to_i }
    phone_number          { Faker::PhoneNumber.cell_phone }
  end

end
