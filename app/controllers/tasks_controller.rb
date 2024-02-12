class TasksController < ApplicationController
    before_action :set_task, only: [:show, :update, :destroy]
  
    def index
        @tasks = Task.all
        render json: @tasks
      end
      
  
    def show
      render json: @task
    end
  
    def create
      @task = Task.new(task_params)
    
      if @task.save
        render json: @task, status: :created, location: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end
  
    def update
        if @task
          if @task.update(task_params)
            render json: @task
          else
            render json: @task.errors, status: :unprocessable_entity
          end
        else
          render json: { error: "Task not found" }, status: :not_found
        end
      end
  
    def destroy
      @task.destroy
    end
  
    private
    def set_task
        @task = Task.find_by(id: params[:id])
        unless @task
        render json: { error: "Task not found" }, status: :not_found
    end
    
  
      def task_params
        params.require(:task).permit(:title, :description, :completed, :user_id, sub_tasks_attributes: [:id, :title, :completed])
      end
  end
end
  