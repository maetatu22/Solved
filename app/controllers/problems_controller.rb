class ProblemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:search]


  def index
    @problems = Problem.includes(:user).order("created_at DESC")
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      redirect_to problem_path(@problem.id)
    else
      render :new
    end
  end

  def show
    @problem = Problem.find(params[:id])
    @comment = Comment.new
    @comments = @problem.comments.includes(:problem,:user).order("created_at ASC")
  end
  
  def search
   
    @problems = Problem.search(params[:keyword])
  end

  def edit
    @problem = Problem.find(params[:id])
  end

  def update
    @problem = Problem.find(params[:id])
    if @problem.update(problem_params)
      redirect_to problem_path(@problem.id)
    else
      render :edit
    end
  end

  def destroy
    @problem =Problem.find(params[:id])
    if @problem.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def best_answer
    @comments = Comment.select(:problem_id, :user_id).distinct.where(problem_id: params[:id]).where.not(user_id: current_user.id)
    @problem = Problem.find(params[:id])
  end

  private

  def problem_params
    params.require(:problem).permit(:image,:title, :text, :genre_id).merge(user_id: current_user.id)
  end
end
