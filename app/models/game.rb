class Game < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true
  validates :description, presence: true
end
