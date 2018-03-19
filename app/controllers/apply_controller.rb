class ApplyController < ApplicationController

  def create
    @project = Project.find(params[:id])

    current_company.applies.create(project_id: @project.id, amount_of_money: params[:amount_of_money])
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    current_company.applies.find_by(project_id: @project.id).destroy
    redirect_to project_path(@project)
  end

  def status_change
    @apply = Apply.find(params[:id])
    if @apply.apply?
      @apply.success!
    end
    redirect_to user_path(current_user)
  end
end
