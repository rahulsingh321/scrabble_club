class Game < ApplicationRecord
  validates :title, :description, presence: true

  has_many :matches, dependent: :destroy
end
