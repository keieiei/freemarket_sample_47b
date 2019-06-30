require 'rails_helper'
describe User, type: :model do
  describe '#create' do
    context 'can save' do
      it 'profileとicon以外が空欄でなければ保存できる' do
        user = build(:user, profile: nil, icon: nil)
        expect(user).to be_valid
      end
      it 'profileとicon以外が空欄でなく、かつvalid(:admin)とした時、電話番号が空欄でも保存できる' do
        user = build(:user, profile: nil, icon: nil, phone_number: nil)
        expect(user).to be_valid(:admin)
      end
      it 'passwordが6文字以上で保存できる' do
        user = build(:user, password: "000000", password_confirmation: "000000")
        expect(user).to be_valid
      end
      it 'phone_numberが固定電話で10桁で保存できる' do
        user = build(:user, phone_number: "0565123456")
        expect(user).to be_valid
      end
      it 'phone_numberが携帯電話で11桁で保存できる' do
        user = build(:user, phone_number: "08012345678")
        expect(user).to be_valid
      end
    end
    context 'can not save' do
      it 'nicknameが空欄だと保存できない' do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end
      it 'passwordが空欄だと保存できない' do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end
      it 'passwordが5文字以下だと保存できない' do
        user = build(:user, password: "00000")
        user.valid?
        expect(user.errors[:password]).to include("は6文字以上で入力してください")
      end
      it 'password_confirmationがpasswordと一致しないと保存できない' do
        user = build(:user, password: "000000", password_confirmation: "000001")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
      it 'family_nameが空欄だと保存できない' do
        user = build(:user, family_name: nil)
        user.valid?
        expect(user.errors[:family_name]).to include("を入力してください")
      end
      it 'family_nameが半角だと保存できない' do
        user = build(:user, family_name: "ﾃｽﾄ")
        user.valid?
        expect(user.errors[:family_name]).to include("全角のみで入力して下さい")
      end
      it 'first_nameが空欄だと保存できない' do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("を入力してください")
      end
      it 'first_nameが半角だと保存できない' do
        user = build(:user, first_name: "ﾃｽﾄ")
        user.valid?
        expect(user.errors[:first_name]).to include("全角のみで入力して下さい")
      end
      it 'family_name_kanaが空欄だと保存できない' do
        user = build(:user, family_name_kana: nil)
        user.valid?
        expect(user.errors[:family_name_kana]).to include("を入力してください")
      end
      it 'family_name_kanaが半角だと保存できない' do
        user = build(:user, family_name_kana: "ﾃｽﾄ")
        user.valid?
        expect(user.errors[:family_name_kana]).to include("全角カタカナのみで入力して下さい")
      end
      it 'family_name_kanaが全角平仮名だと保存できない' do
        user = build(:user, family_name_kana: "てすと")
        user.valid?
        expect(user.errors[:family_name_kana]).to include("全角カタカナのみで入力して下さい")
      end
      it 'first_name_kanaが空欄だと保存できない' do
        user = build(:user, first_name_kana: nil)
        user.valid?
        expect(user.errors[:first_name_kana]).to include("を入力してください")
      end
      it 'first_name_kanaが半角だと保存できない' do
        user = build(:user, first_name_kana: "ﾃｽﾄ")
        user.valid?
        expect(user.errors[:first_name_kana]).to include("全角カタカナのみで入力して下さい")
      end
      it 'first_name_kanaが全角平仮名だと保存できない' do
        user = build(:user, first_name_kana: "てすと")
        user.valid?
        expect(user.errors[:first_name_kana]).to include("全角カタカナのみで入力して下さい")
      end
      it 'birth_yearが空欄だと保存できない' do
        user = build(:user, birth_year: nil)
        user.valid?
        expect(user.errors[:birth_year]).to include("を入力してください")
      end
      it 'birth_monthが空欄だと保存できない' do
        user = build(:user, birth_month: nil)
        user.valid?
        expect(user.errors[:birth_month]).to include("を入力してください")
      end
      it 'birth_dayが空欄だと保存できない' do
        user = build(:user, birth_day: nil)
        user.valid?
        expect(user.errors[:birth_day]).to include("を入力してください")
      end
      it 'phone_numberが空欄だと保存できない' do
        user = build(:user, phone_number: nil)
        user.valid?
        expect(user.errors[:phone_number]).to include("を入力してください")
      end
      it 'phone_numberが固定電話で9桁だと保存できない' do
        user = build(:user, phone_number: '056512345')
        user.valid?
        expect(user.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが固定電話で11桁だと保存できない' do
        user = build(:user, phone_number: '05651234567')
        user.valid?
        expect(user.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが携帯電話で10桁だと保存できない' do
        user = build(:user, phone_number: '0801234567')
        user.valid?
        expect(user.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが携帯電話で12桁だと保存できない' do
        user = build(:user, phone_number: '080123456789')
        user.valid?
        expect(user.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが0120から始まると保存できない' do
        user = build(:user, phone_number: '0120123456')
        user.valid?
        expect(user.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが0800から始まると保存できない' do
        user = build(:user, phone_number: '08001234567')
        user.valid?
        expect(user.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが0037から始まると保存できない' do
        user = build(:user, phone_number: '003712312345123456')
        user.valid?
        expect(user.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが0066から始まると保存できない' do
        user = build(:user, phone_number: '00661231234567')
        user.valid?
        expect(user.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが00777から始まると保存できない' do
        user = build(:user, phone_number: '0077712345')
        user.valid?
        expect(user.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが00882から始まると保存できない' do
        user = build(:user, phone_number: '0088212345')
        user.valid?
        expect(user.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが0570から始まると保存できない' do
        user = build(:user, phone_number: '0570123456')
        user.valid?
        expect(user.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが0990から始まると保存できない' do
        user = build(:user, phone_number: '0990123456')
        user.valid?
        expect(user.errors[:phone_number]).to include("無効な電話番号です")
      end
      it 'phone_numberが020から始まると保存できない' do
        user = build(:user, phone_number: '02012345678')
        user.valid?
        expect(user.errors[:phone_number]).to include("無効な電話番号です")
      end
    end
  end
end