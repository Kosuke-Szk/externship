class ApplyController < ApplicationController

  def create
    @project = Project.find(params[:id])
    current_company.applies.create(project_id: @project.id)
    redirect_to project_path(@project)
  end

  def destroy
    
  end
end
