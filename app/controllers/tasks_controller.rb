class TasksController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @tasks = Task.all.order(created_at: :desc)
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.create(task_params)
        if @task.save
            redirect_to tasks_path
            flash[:notice] = "新規タスクを追加しました"
        else
            redirect_to("/tasks/new")
            flash[:notice] = "追加に失敗しました"
        end
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        @task.update(task_params)
        redirect_to tasks_path
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to tasks_path
    end

    def show
        @task = Task.find(params[:id])
    end

    private
    def task_params
        params.require(:task).permit(:content, :title, :user_id)
    end
end
