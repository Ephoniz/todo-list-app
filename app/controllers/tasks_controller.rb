class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: "Task was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    set_task
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_path, notice: "Task was successfully deleted." }
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :status, :importance, :deadline)
  end
end
