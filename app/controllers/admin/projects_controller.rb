class Admin::ProjectsController < ApplicationController
  before_action :find_project_by_id, only: %i(edit update destroy)

  def index
    @projects = Project.newest
  end

  def new
    @project = Project.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @project = Project.new project_params

    if @project.save
      respond_to do |format|
        format.js
      end
      flash[:success] = t "project_create"
      redirect_to admin_projects_path
    else
      render :new
    end
  end

  def destroy
    if @project.destroy
      flash[:success] = t "project_deleted"
      redirect_to admin_projects_url
    else
      flash[:danger] = t "delete_fail"
    end
  end

  private

  def find_project_by_id
    @project = Project.find_by id: params[:id]

    return if @project
    flash[:danger] = t "not_found"
    redirect_to admin_projects_url
  end

  def project_params
    params.require(:project).permit :name, :short_name, :start_date, :end_date
  end
end
