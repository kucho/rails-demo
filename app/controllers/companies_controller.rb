class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token

  def index
    @companies = Company.all # Get all the companies and saved them on @games
    render json: @companies # Render all the companies on JSON format
  end

  def show
    render json: @company # render the specific company using json format
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      render json: @company
    else
      render json: @company.errors
    end
  end

  def destroy
    @company.destroy # Destroy it.
    render json: { status: 'Successfully destroyed', data: @company }, status: :ok
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :description, :country, :start_date)
  end
end
