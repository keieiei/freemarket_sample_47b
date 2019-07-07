class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, length: { minimum: 6 }
  validates :family_name, presence: true,
                          zenkaku: true
  validates :first_name, presence: true,
                        zenkaku: true
  validates :family_name_kana, presence: true,
                              zenkaku_kana: true
  validates :first_name_kana, presence: true,
                              zenkaku_kana: true
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  validates :postal_code, postal_code: true

  with_options unless: proc { [:admin].include?(validation_context) } do
    validates :phone_number,  presence: true,
                              telphone: true
  end

  validates_specific :nickname
  validates_specific :postal_code

  enum prefecture: I18n.t('prefecture')

  has_one :credit_card
  has_one :receiver_information
end
