class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
    params['user'] = current_user.id
    @filter = TaskFilter.new(params)
    @tasks = @filter.filter!
  end

  def show
  end

  def new
    @tags = current_user.tags
    @task = Task.new
  end

  def create
    @tags = current_user.tags
    @task = Task.new(task_params)
    @task.user = current_user

    respond_to do |format|
      if add_tags && @task.save
        format.html { redirect_to tasks_path, notice: "Task was successfully created." }
      else
        format.html { render :new, notice: "Couldn't create the task, please try again." }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
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

  def add_tags
    selected_tags = params['task']['tags']
    return false unless selected_tags.size <= 3
    return true if selected_tags.nil?

    selected_tags.each do |tag_id|
      tag = Tag.find(tag_id.to_i)
      TaskTag.create(tag: tag, task: @task)
    end
  end
end
