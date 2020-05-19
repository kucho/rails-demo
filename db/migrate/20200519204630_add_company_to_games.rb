# frozen_string_literal: true

class AddCompanyToGames < ActiveRecord::Migration[6.0]
  def change
    add_reference :games, :company, foreign_key: true
  end
end
