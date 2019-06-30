class ReceiverInformation < ApplicationRecord
  validates :family_name, presence: true,
                          zenkaku: true
  validates :first_name, presence: true,
                         zenkaku: true
  validates :family_name_kana, presence: true,
                               zenkaku_kana: true
  validates :first_name_kana, presence: true,
                              zenkaku_kana: true
  validates :postal_code, presence: true,
                          postal_code: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :phone_number, telphone: true, allow_blank: true

  enum prefecture: I18n.t('prefecture')

  belongs_to :user
end
