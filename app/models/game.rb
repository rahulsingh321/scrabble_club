class Game < ApplicationRecord
  validates :title, :description, presence: true, uniqueness: true

  has_many :matches, dependent: :destroy
end
