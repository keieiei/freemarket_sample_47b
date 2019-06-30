class CreditCardSecurityCodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? && value !~ /\A\d{3,4}\z/
      record.errors[attribute] << '3~4桁の数字を入力して下さい'
    end
  end
end