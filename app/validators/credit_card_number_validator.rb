class CreditCardNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? && value !~ /\A\d{14,16}\z/ 
      record.errors[attribute] << '14~16桁の数字を入力して下さい'
    end
  end
end