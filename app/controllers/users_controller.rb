class UsersController < ApplicationController

  def profile
    @user = User.find(params[:id])
  end

  def profile_edit
    @user = User.find(params[:id])
  end

  def profile_update
    @user = User.find(params[:id])
    if @user.update(profile_params)
      redirect_to profile_user_path(@user.id)
    else
      render :edit
    end
  end

  def show
  @user = User.find(params[:id])
  @name = @user.name
  @problems = @user.problems
  end

  def profile_params
    params.require(:user).permit(:name,:self_introduction, :gender_id, :birthday)
  end
end
