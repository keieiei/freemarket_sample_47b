class CreditCardNumberValidator < ActiveModel::Validator
  include CreditCardHelper

  def validate(record)
    card_number = record.send(options[:card_number])
    card_company = credit_card_campany(card_number)
    if card_number.present? && card_company == nil
      record.errors.add(:base, '登録可能なクレジットカード会社の番号を入力して下さい')
    end
  end
end