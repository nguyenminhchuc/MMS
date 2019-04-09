class Admin::UsersController < ApplicationController
  before_action :find_user_by_id, only: %i(edit update destroy)

  def index
    @users = User.newest
  end

  def edit; end

  def update
    respond_to do |format|
      if @user.update user_params
        format.json { head :no_content }
        format.js
      end
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "_deleted"
      redirect_to admin_users_url
    else
      flash[:danger] = t "delete_fail"
    end
  end

  private

  def find_user_by_id
    @user = User.find_by id: params[:id]

    return if @user
    flash[:danger] = t "not_found"
    redirect_to admin_users_url
  end

  def user_params
    params.require(:user).permit :team_id,:position_id, skill_ids:[],
      skills_attributes: [:name, :level, :used_year_member]
  end
end
