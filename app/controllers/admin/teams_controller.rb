class Admin::TeamsController < ApplicationController
  before_action :find_team_by_id, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.newest
  end

  def new
    @team = Team.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @team = Team.new team_params
    if @team.save
      respond_to do |format|
        format.js
      end
      flash[:success] = t "team_create"
      redirect_to admin_teams_path
    else
      render :new
    end
  end

  def destroy
    if @team.destroy
      flash[:success] = t "tour_deleted"
      redirect_to admin_teams_url
    else
      flash[:danger] = t "delete_fail"
    end
  end

  private

  def find_team_by_id
    @team = Team.find_by id: params[:id]

    return if @team
    flash[:danger] = t "not_found"
    redirect_to admin_teams_url
  end

  def team_params
    params.require(:team).permit :name, :description, :name_leader_team
  end
end
