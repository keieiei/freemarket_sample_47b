class PostalCodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? && value !~ /\A[0-9]{3}-[0-9]{4}\z/
      record.errors[attribute] << '正規の郵便番号を入力して下さい'
    end
  end
end