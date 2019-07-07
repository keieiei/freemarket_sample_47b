class CreditCardSecurityCodeValidator < ActiveModel::Validator
  include CreditCardHelper

  def validate(record)
    card_number = record.send(options[:card_number])
    card_company = credit_card_campany(card_number)
    security_code = record.send(options[:security_code])

    return unless card_number.present? && security_code.present? && card_company != nil

    if card_company == 4 && security_code !~ /\A\d{4}\z/
      record.errors.add(:base, '4桁の番号を入力して下さい')
    elsif card_company != 4  && security_code !~ /\A\d{3}\z/
      record.errors.add(:base, '3桁の番号を入力して下さい')
    end
  end
end