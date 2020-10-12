class ProblemsController < ApplicationController
  

  def index
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problrm.new(problem_params)
    if @problem.sava
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def problem_params
    params.require(:problem).permit(:title, :text, :genre_id).merge(user_id: current_user.id)
  end
end
