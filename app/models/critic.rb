# frozen_string_literal: true

class Critic < ApplicationRecord
  belongs_to :game
  validates :username,
            length: { in: 2...12 },
            format: { with: /^[a-zA-Z\s0-9]+$/,
                      message: 'only allows alphanumeric values' }
  validates :title, :body, presence: { message: 'Please write something!' }
end
