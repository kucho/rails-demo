# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :company
  has_many :critics
  validate :name, :genre, :price, :release_date, :company, precense: true
  validate :genre,
           inclusion: { in: %w(Simulator Adventure
                               Strategy Role-playing (RPG)
                               Shooter Fighting Sport),
                        message: '%<value> is not a valid genre' }
  validate :price, numericality: { greater_than: 0 }
end
