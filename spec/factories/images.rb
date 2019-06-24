FactoryBot.define do
  factory :image do
    image {File.open("#{Rails.root}/spec/image/test.png")} #テスト実施時、左記パスに画像設置
    item_id {Faker::Number.digit}
    created_at {Time.now}
    updated_at {Time.now}
  end
end
