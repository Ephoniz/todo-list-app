class TaskFilter
  attr_reader :user, :deadline, :importance, :status

  def initialize(params)
    @user = params.dig(:user)
    @deadline = params.dig(:search, :deadline)
    @importance = params.dig(:search, :importance)
    @status = params.dig(:search, :status)
  end

  def filter!
    @tasks = Task.all
    filter_by_user
    filter_by_status
    filter_by_importance
    filter_by_deadline
    @tasks
  end

  private

  def filter_by_user
    return unless user.present?

    @tasks = @tasks.where(user: user)
  end

  def filter_by_deadline
    return unless deadline.present?

    @tasks = @tasks.where('deadline <= ?', deadline)
  end

  def filter_by_status
    return unless status.present?

    @tasks = @tasks.where(status: status)
  end

  def filter_by_importance
    return unless importance.present?

    @tasks = @tasks.where(importance: importance)
  end
end