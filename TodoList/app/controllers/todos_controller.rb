class TodosController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @todos = Todo.all
  end
  
  def new
  end
    @todo = Todo.new
  def edit
    @todo = Todo.find(params[:id])
    render :edit
  end
  
  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to @todo
    else
      render 'edit'
    end
  end
  
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    
    redirect_to todos_path
  end
  
  def create
    @todo = Todo.new(todo_params)
    
    @todo.save
      redirect_to @todo
  end
  
  def show
    @todo = Todo.find(params[:id])
  end
  
  private
    def todo_params
      params.require(:todo).permit(:category_id, :description, :level)
    end
end
