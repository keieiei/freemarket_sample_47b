require 'rails_helper'
RSpec.describe Image, type: :model do
  describe '#Create' do
    context 'can save' do
      it "is valid with image and item_id" do
          expect(FactoryBot.build(:image)).to be_valid
      end
    end
    context 'cant save' do
      it "is invalid without image" do      
        image = FactoryBot.build(:image, image: nil)
        image.valid?
        expect(image.errors[:image]).to include('を入力してください')
      end
      it "is invalid without item_id" do      
        item_id = FactoryBot.build(:image, item_id: nil)
        item_id.valid?
        expect(item_id.errors[:item_id]).to include('を入力してください')
      end
    end
  end
end
