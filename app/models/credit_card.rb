class CreditCard < ApplicationRecord
  validates :card_number, presence: true,
                          credit_card_number: true
  validates :valid_month, presence: true,
                          credit_card_valid: true
  validates :valid_year, presence: true,
                         credit_card_valid: true
  validates :security_code, presence: true,
                            credit_card_security_code: true

  belongs_to :user
end
