# frozen_string_literal: true

class Company < ApplicationRecord
  validates :name,
            uniqueness: true,
            presence: true,
            length: { maximum: 40 }

  validates :country, presence: true
end
