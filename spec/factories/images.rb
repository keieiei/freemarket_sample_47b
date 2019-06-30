FactoryBot.define do
  factory :image do
    image {File.open("#{Rails.root}/spec/image/test.png")} #テスト実施時、左記パスに画像設置
    association :item
  end
end
