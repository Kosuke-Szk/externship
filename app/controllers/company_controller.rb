class CompanyController < ApplicationController
  before_action :correct_company, only: [:edit, :update]
  def show
    @company = Company.find(params[:id])
    project_title_array = []
    keys = @company.applies.pluck(:project_id)
    keys.each do |key|
      project_title_array << Project.find(key).title
    end
    array = @company.applies.pluck(:amount_of_money)
    @portfolio_chart = [project_title_array, array].transpose.to_h
  end

  def edit
  end

  def update
    if @company.update_attributes(company_params)
      redirect_to @company
    else
      render 'edit'
    end
  end

  private
    def company_params
      params.require(:company).permit(:email, :company_name, :description, :image, :url)
    end

    def correct_company
      @company = Company.find(params[:id])
      redirect_to(root_url) unless current_company?(@company)
    end

    def current_company?(company)
      company == current_company
    end
end
