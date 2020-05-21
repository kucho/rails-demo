# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :company
  has_many :critics
  validates :name, :genre, :price, :release_date, :company, presence: true
  validates :genre,
            inclusion: { in: ['Simulator', 'Adventure',
                              'Strategy', 'Role-playing (RPG)',
                              'Shooter', 'Fighting', 'Sport'],
                         message: '%<value> is not a valid genre' }
  validates :price, numericality: { greater_than: 0 }
end
