class ZenkakuValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? && value !~ /\A^[^ -~｡-ﾟ]+\z/
      record.errors[attribute] << '全角のみで入力して下さい'
    end
  end
end