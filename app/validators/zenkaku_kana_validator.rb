class ZenkakuKanaValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? && value !~ /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/
      record.errors[attribute] << '全角カタカナのみで入力して下さい'
    end
  end
end