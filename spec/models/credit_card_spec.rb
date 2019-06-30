require 'rails_helper'
describe CreditCard, type: :model do
  describe '#create' do
    context 'can save' do
      it '空欄でなければ保存できる' do
        credit_card = build(:credit_card)
        expect(credit_card).to be_valid
      end
    end
    context 'can not save' do
      it 'card_numberが空欄だと保存できない' do
        credit_card = build(:credit_card, card_number: nil)
        credit_card.valid?
        expect(credit_card.errors[:card_number]).to include("を入力してください")
      end
      it 'card_numberが13桁だと保存できない' do
        credit_card = build(:credit_card, card_number: Faker::Number.number(13).to_s)
        credit_card.valid?
        expect(credit_card.errors[:card_number]).to include("14~16桁の数字を入力して下さい")
      end
      it 'card_numberが17桁だと保存できない' do
        credit_card = build(:credit_card, card_number: Faker::Number.number(17).to_s)
        credit_card.valid?
        expect(credit_card.errors[:card_number]).to include("14~16桁の数字を入力して下さい")
      end
      it 'valid_monthが空欄だと保存できない' do
        credit_card = build(:credit_card, valid_month: nil)
        credit_card.valid?
        expect(credit_card.errors[:valid_month]).to include("を入力してください")
      end
      it 'valid_monthが1桁だと保存できない' do
        credit_card = build(:credit_card, valid_month: Faker::Number.number(1).to_s)
        credit_card.valid?
        expect(credit_card.errors[:valid_month]).to include("2桁の数字で入力して下さい")
      end
      it 'valid_monthが3桁だと保存できない' do
        credit_card = build(:credit_card, valid_month: Faker::Number.number(3).to_s)
        credit_card.valid?
        expect(credit_card.errors[:valid_month]).to include("2桁の数字で入力して下さい")
      end
      it 'valid_yearが空欄だと保存できない' do
        credit_card = build(:credit_card, valid_year: nil)
        credit_card.valid?
        expect(credit_card.errors[:valid_year]).to include("を入力してください")
      end
      it 'valid_yearが1桁だと保存できない' do
        credit_card = build(:credit_card, valid_year: Faker::Number.number(1).to_s)
        credit_card.valid?
        expect(credit_card.errors[:valid_year]).to include("2桁の数字で入力して下さい")
      end
      it 'valid_yearが3桁だと保存できない' do
        credit_card = build(:credit_card, valid_year: Faker::Number.number(3).to_s)
        credit_card.valid?
        expect(credit_card.errors[:valid_year]).to include("2桁の数字で入力して下さい")
      end
      it 'security_codeが空欄だと保存できない' do
        credit_card = build(:credit_card, security_code: nil)
        credit_card.valid?
        expect(credit_card.errors[:security_code]).to include("を入力してください")
      end
      it 'security_codeが2桁だと保存できない' do
        credit_card = build(:credit_card, security_code: Faker::Number.number(2).to_s)
        credit_card.valid?
        expect(credit_card.errors[:security_code]).to include("3~4桁の数字を入力して下さい")
      end
      it 'security_codeが5桁だと保存できない' do
        credit_card = build(:credit_card, security_code: Faker::Number.number(5).to_s)
        credit_card.valid?
        expect(credit_card.errors[:security_code]).to include("3~4桁の数字を入力して下さい")
      end
      it 'user_idが空欄だと保存できない' do
        credit_card = build(:credit_card, user_id: nil)
        credit_card.valid?
        expect(credit_card.errors[:user]).to include("を入力してください")
      end
    end
  end
end