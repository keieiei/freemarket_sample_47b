class TelphoneValidator < ActiveModel::EachValidator
  REJECTABLE_TYPES = %i(toll_free uan premium_rate pager).freeze

  def validate_each(record, attribute, value)
    parsed_tel = Phonelib.parse(value, :jp)
    return unless parsed_tel.invalid? || parsed_tel.types.any? { |type| REJECTABLE_TYPES.include?(type) }

    record.errors[attribute] << '無効な電話番号です'
  end
end