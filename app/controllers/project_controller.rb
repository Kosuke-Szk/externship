class ProjectController < ApplicationController
  before_action :correct_user, only: [:destory]
  before_action :logged_in_user, only: [:create, :update, :new, :edit]
  before_action :can_edit?, only: [:edit,:update]

  def index
    @projects = Project.all
    if params[:search]
      @projects = Project.all.search(params[:search])
    else
      @projects
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "求人が登録されました"
      redirect_to project_index_path
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    @project = Project.find_by(id: params[:id])
    if @project.update_attributes(project_params)
      redirect_to @project
    else
      render action: :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to root_path
  end

  private
    def project_params
      params.require(:project).permit(:user_id, :target_amount_of_money, :current_amount_of_money, :description, :title, :image, :opinion)
    end

    def can_edit?
      @project = Project.find(params[:id]);
      redirect_to root_path if (@project.user_id != current_user.id)
    end

    def correct_user
      if Project.find(params[:id]).user_id != current_user.id
        redirect_to root_path
      end
    end
end