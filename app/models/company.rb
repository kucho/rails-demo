# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :games, dependent: :destroy
  validates :name,
            uniqueness: true,
            presence: true,
            length: { maximum: 40 }

  validates :country, presence: true
end
