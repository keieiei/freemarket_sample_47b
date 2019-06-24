require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#Create' do
    context 'can save' do
      it "is valid with all data" do
          expect(FactoryBot.build(:item)).to be_valid
      end

      it "is valid wittout brand" do      
        item = FactoryBot.build(:item, brand: nil)
        expect(item).to be_valid
      end
    end
    context 'cant save' do
      it "is invalid without name" do      
        item = FactoryBot.build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include('を入力してください')
      end
      it "is invalid without detail" do      
        item = FactoryBot.build(:item, detail: nil)
        item.valid?
        expect(item.errors[:detail]).to include('を入力してください')
      end
      it "is invalid without price" do       
        item = FactoryBot.build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include('を入力してください')
      end
      it "is invalid without price more than 8 digits" do    
        item = FactoryBot.build(:item, price: '11111111')
        item.valid?
        expect(item.errors[:price]).to include('は7文字以内で入力してください')
      end
      it "is invalid without size" do       
        item = FactoryBot.build(:item, size: nil)
        item.valid?
        expect(item.errors[:size]).to include('を入力してください')
      end
      it "is invalid without delivery_charge" do       
        item = FactoryBot.build(:item, delivery_charge: nil)
        item.valid?
        expect(item.errors[:delivery_charge]).to include('を入力してください')
      end

      it "is invalid without delivery_prefecture" do       
        item = FactoryBot.build(:item, delivery_prefecture: nil)
        item.valid?
        expect(item.errors[:delivery_prefecture]).to include('を入力してください')
      end
      it "is invalid without delivery_time" do       
        item = FactoryBot.build(:item, delivery_time: nil)
        item.valid?
        expect(item.errors[:delivery_time]).to include('を入力してください')
      end
      it "is invalid without delivery_way" do       
        item = FactoryBot.build(:item, delivery_way: nil)
        item.valid?
        expect(item.errors[:delivery_way]).to include('を入力してください')
      end
      it "is invalid without state" do       
        item = FactoryBot.build(:item, state: nil)
        item.valid?
        expect(item.errors[:state]).to include('を入力してください')
      end
      it "is invalid without large_category" do       
        item = FactoryBot.build(:item, large_category: nil)
        item.valid?
        expect(item.errors[:large_category]).to include('を入力してください')
      end
      it "is invalid without middle_category" do       
        item = FactoryBot.build(:item, middle_category: nil)
        item.valid?
        expect(item.errors[:middle_category]).to include('を入力してください')
      end
      it "is invalid without small_category" do       
        item = FactoryBot.build(:item, small_category: nil)
        item.valid?
        expect(item.errors[:small_category]).to include('を入力してください')
      end
    end
  end
end
