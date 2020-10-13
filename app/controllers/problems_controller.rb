class ProblemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @problems = Problem.all
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @problem = Problem.find(params[:id])
  end

  private

  def problem_params
    params.require(:problem).permit(:title, :text, :genre_id).merge(user_id: current_user.id)
  end
end
