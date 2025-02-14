class Game < ApplicationRecord
  belongs_to :genre
  has_one_attached :image
  validates :title, presence: true
  validates :description, presence: true
  validates :genre_id, presence: true
  has_many :reviews, dependent: :destroy
end
