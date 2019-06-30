require 'rails_helper'
describe ReceiverInformation, type: :model do
  describe '#create' do
    context 'can save' do
      it 'buildingとphone_number以外が空欄でなければ保存できる' do
        receiver_information = build(:receiver_information, building: nil, phone_number: nil)
        expect(receiver_information).to be_valid
      end
    end
    context 'can not save' do
      it 'family_nameが空欄だと保存できない' do
        receiver_information = build(:receiver_information, family_name: nil)
        receiver_information.valid?
        expect(receiver_information.errors[:family_name]).to include("を入力してください")
      end
      it 'family_nameが半角だと保存できない' do
        receiver_information = build(:receiver_information, family_name: "ﾃｽﾄ")
        receiver_information.valid?
        expect(receiver_information.errors[:family_name]).to include("全角のみで入力して下さい")
      end
      it 'first_nameが空欄だと保存できない' do
        receiver_information = build(:receiver_information, first_name: nil)
        receiver_information.valid?
        expect(receiver_information.errors[:first_name]).to include("を入力してください")
      end
      it 'first_nameが半角だと保存できない' do
        receiver_information = build(:receiver_information, first_name: "ﾃｽﾄ")
        receiver_information.valid?
        expect(receiver_information.errors[:first_name]).to include("全角のみで入力して下さい")
      end
      it 'family_name_kanaが空欄だと保存できない' do
        receiver_information = build(:receiver_information, family_name_kana: nil)
        receiver_information.valid?
        expect(receiver_information.errors[:family_name_kana]).to include("を入力してください")
      end
      it 'family_name_kanaが半角だと保存できない' do
        receiver_information = build(:receiver_information, family_name_kana: "ﾃｽﾄ")
        receiver_information.valid?
        expect(receiver_information.errors[:family_name_kana]).to include("全角カタカナのみで入力して下さい")
      end
      it 'family_name_kanaが全角平仮名だと保存できない' do
        receiver_information = build(:receiver_information, family_name_kana: "てすと")
        receiver_information.valid?
        expect(receiver_information.errors[:family_name_kana]).to include("全角カタカナのみで入力して下さい")
      end
      it 'first_name_kanaが空欄だと保存できない' do
        receiver_information = build(:receiver_information, first_name_kana: nil)
        receiver_information.valid?
        expect(receiver_information.errors[:first_name_kana]).to include("を入力してください")
      end
      it 'first_name_kanaが半角だと保存できない' do
        receiver_information = build(:receiver_information, first_name_kana: "ﾃｽﾄ")
        receiver_information.valid?
        expect(receiver_information.errors[:first_name_kana]).to include("全角カタカナのみで入力して下さい")
      end
      it 'first_name_kanaが全角平仮名だと保存できない' do
        receiver_information = build(:receiver_information, first_name_kana: "てすと")
        receiver_information.valid?
        expect(receiver_information.errors[:first_name_kana]).to include("全角カタカナのみで入力して下さい")
      end
      it 'postal_codeが空欄だと保存できない' do
        receiver_information = build(:receiver_information, postal_code: nil)
        receiver_information.valid?
        expect(receiver_information.errors[:postal_code]).to include("を入力してください")
      end
      it 'postal_codeが2桁-4桁だと保存できない' do
        receiver_information = build(:receiver_information, postal_code: "12-1234")
        receiver_information.valid?
        expect(receiver_information.errors[:postal_code]).to include("正規の郵便番号を入力して下さい")
      end
      it 'postal_codeが4桁-4桁だと保存できない' do
        receiver_information = build(:receiver_information, postal_code: "1234-1234")
        receiver_information.valid?
        expect(receiver_information.errors[:postal_code]).to include("正規の郵便番号を入力して下さい")
      end
      it 'postal_codeが3桁-3桁だと保存できない' do
        receiver_information = build(:receiver_information, postal_code: "123-123")
        receiver_information.valid?
        expect(receiver_information.errors[:postal_code]).to include("正規の郵便番号を入力して下さい")
      end
      it 'postal_codeが3桁-5桁だと保存できない' do
        receiver_information = build(:receiver_information, postal_code: "123-12345")
        receiver_information.valid?
        expect(receiver_information.errors[:postal_code]).to include("正規の郵便番号を入力して下さい")
      end
      it 'postal_codeが-がないと保存できない' do
        receiver_information = build(:receiver_information, postal_code: "1231234")
        receiver_information.valid?
        expect(receiver_information.errors[:postal_code]).to include("正規の郵便番号を入力して下さい")
      end
      it 'prefectureが空欄だと保存できない' do
        receiver_information = build(:receiver_information, prefecture: nil)
        receiver_information.valid?
        expect(receiver_information.errors[:prefecture]).to include("を入力してください")
      end
      it 'cityが空欄だと保存できない' do
        receiver_information = build(:receiver_information, city: nil)
        receiver_information.valid?
        expect(receiver_information.errors[:city]).to include("を入力してください")
      end
      it 'streetが空欄だと保存できない' do
        receiver_information = build(:receiver_information, street: nil)
        receiver_information.valid?
        expect(receiver_information.errors[:street]).to include("を入力してください")
      end
      it 'phone_numberが固定電話で9桁だと保存できない' do
        receiver_information = build(:receiver_information, phone_number: '056512345')
        receiver_information.valid?
        expect(receiver_information.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが固定電話で11桁だと保存できない' do
        receiver_information = build(:receiver_information, phone_number: '05651234567')
        receiver_information.valid?
        expect(receiver_information.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが携帯電話で10桁だと保存できない' do
        receiver_information = build(:receiver_information, phone_number: '0801234567')
        receiver_information.valid?
        expect(receiver_information.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが携帯電話で12桁だと保存できない' do
        receiver_information = build(:receiver_information, phone_number: '080123456789')
        receiver_information.valid?
        expect(receiver_information.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが0120から始まると保存できない' do
        receiver_information = build(:receiver_information, phone_number: '0120123456')
        receiver_information.valid?
        expect(receiver_information.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが0800から始まると保存できない' do
        receiver_information = build(:receiver_information, phone_number: '08001234567')
        receiver_information.valid?
        expect(receiver_information.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが0037から始まると保存できない' do
        receiver_information = build(:receiver_information, phone_number: '003712312345123456')
        receiver_information.valid?
        expect(receiver_information.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが0066から始まると保存できない' do
        receiver_information = build(:receiver_information, phone_number: '00661231234567')
        receiver_information.valid?
        expect(receiver_information.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが00777から始まると保存できない' do
        receiver_information = build(:receiver_information, phone_number: '0077712345')
        receiver_information.valid?
        expect(receiver_information.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが00882から始まると保存できない' do
        receiver_information = build(:receiver_information, phone_number: '0088212345')
        receiver_information.valid?
        expect(receiver_information.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが0570から始まると保存できない' do
        receiver_information = build(:receiver_information, phone_number: '0570123456')
        receiver_information.valid?
        expect(receiver_information.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが0990から始まると保存できない' do
        receiver_information = build(:receiver_information, phone_number: '0990123456')
        receiver_information.valid?
        expect(receiver_information.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが020から始まると保存できない' do
        receiver_information = build(:receiver_information, phone_number: '02012345678')
        receiver_information.valid?
        expect(receiver_information.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'user_idが空欄だと保存できない' do
        receiver_information = build(:receiver_information, user_id: nil)
        receiver_information.valid?
        expect(receiver_information.errors[:user]).to include("を入力してください")
      end
    end
  end
end