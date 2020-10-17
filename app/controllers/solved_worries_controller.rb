class SolvedWorriesController < ApplicationController

  def create
    problem = Problem.find(params[:problem_id])
    if solved_worrie = SolvedWorrie.create(problem_id: problem.id)
      redirect_to problem_path(problem.id)
    end
  end

end
