class ProjectController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
  end

  private
    def project_params
      params.require(:project).permit(:user_id, :target_amount_of_money, :current_amount_of_money, :description)
    end
end