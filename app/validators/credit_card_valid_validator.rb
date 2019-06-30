class CreditCardValidValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? && value !~ /\A\d{2}\z/
      record.errors[attribute] << '2桁の数字で入力して下さい'
    end
  end
end