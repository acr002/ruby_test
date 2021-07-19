
class TodosController < ApplicationController
  def index
    @todo = Todo.new
    @todos = Todo.order('created_at ASC')
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      respond_to do |format|
        format.html { redierct_to :root }
        format.json { render json: @todo}
      end
    else
      render :index, alert: 'Todo‚ð“ü—Í‚µ‚Ä‚­‚¾‚³‚¢'
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:content)
  end
end
