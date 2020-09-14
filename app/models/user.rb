class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
    validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :password_confirmation
    validates :birthday
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
    validates :first_name, format: { with: NAME_REGEX }
    validates :last_name, format: { with: NAME_REGEX }
    NAME_KANA_REGEX = /\A[ァ-ン]+\z/.freeze
    validates :first_name_kana, format: { with: NAME_KANA_REGEX }
    validates :last_name_kana, format: { with: NAME_KANA_REGEX }
  end
end
