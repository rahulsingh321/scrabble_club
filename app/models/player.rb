class Player < ApplicationRecord
  validates :first_name, :last_name, :email, :phone, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'requires a valid email format' }

  has_many :participants, dependent: :destroy
end
