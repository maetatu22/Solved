class UsersController < ApplicationController
  
  def show
  user = User.find(params[:id])
  @name = user.name
  @problems = user.problems
  end
end
