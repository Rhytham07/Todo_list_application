class SubTasksController < ApplicationController
    before_action :find_user, only: [:create, :update, :destroy]
    before_action :set_sub_task, only: [:show,  :update, :destroy, :mark_as_complete]
    
    def index
        @tasks = SubTask.all
        render json: @tasks
    end
      

    def create
        find_user
        if @user.user_type == "Admin"
          @sub_task = SubTask.new(task_params)
          @sub_task.save
          render json: @sub_task
        else
          render json: { Message: "only admin can create the sub_task" }
        end
    end
      
  
    def update
      @sub_task.update(task_params)
      render json: @sub_task
    end
  
    def mark_as_complete
      @sub_task.update(mark_as_complete: true)
      render json: {data: @sub_task, Message:"Mark as  completed"}
    end
  
    def destroy
      @sub_task.destroy
      render json: {Message:"sucessfully destroy"}
    end
  
    def show
      render json: @sub_task
    end
  
   
  
    private

    def find_user
      user_id = params[:sub_task][:user_id]
    
      if user_id.present?
        @user = User.find_by(id: user_id)
    
        unless @user
          render json: { error: "User not found with ID #{user_id}" }, status: :not_found
        end
      else
        render json: { error: "User ID is missing" }, status: :unprocessable_entity
      end
    end
    
end    