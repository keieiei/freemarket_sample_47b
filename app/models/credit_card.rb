class CreditCard < ApplicationRecord
  validates :card_number, presence: true
  validates :valid_month, presence: true,
                          credit_card_valid: true
  validates :valid_year, presence: true,
                         credit_card_valid: true
  validates :security_code, presence: true
  validates_with CreditCardValidFutureValidator,
                valid_month: :valid_month, valid_year: :valid_year
  validates_with CreditCardNumberValidator,
                card_number: :card_number
  validates_with CreditCardSecurityCodeValidator,
                card_number: :card_number, security_code: :security_code

  belongs_to :user
end
