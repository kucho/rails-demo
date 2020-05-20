class CompaniesController < ApplicationController
  def index
    @companies = Company.all # Get all the games and saved them on @games
    render json: @companies # Render all the games on JSON format
  end
end
