class BestUsersController < ApplicationController

  def best_create
    if BestUser.create(user_id: params[:user_id],problem_id: params[:id])
      redirect_to problem_path(params[:id])
    end
  end
end
