class CreditCardValidFutureValidator < ActiveModel::Validator
  def validate(record)
    valid_month = record.send(options[:valid_month])
    valid_year = record.send(options[:valid_year])

    return unless valid_month.present? && valid_year.present?

    valid_month = valid_month.to_i
    valid_year = ('20' + valid_year).to_i

    if Date.new(valid_year, valid_month, 1) < Date.today
      record.errors.add(:base, '有効期限が切れています')
    end
  end
end