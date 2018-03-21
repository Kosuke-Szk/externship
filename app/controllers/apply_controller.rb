class ApplyController < ApplicationController

  def create
    @project = Project.find(params[:id])

    @apply = current_company.applies.new(project_id: @project.id, amount_of_money: params[:amount_of_money])
    respond_to do |format|
      if @apply.save
        user = User.find(@project.user_id)
        ApplyMailer.apply_email(user, @apply).deliver
        format.html { redirect_to @project, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
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
