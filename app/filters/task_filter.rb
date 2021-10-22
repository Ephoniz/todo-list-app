class TaskFilter
  attr_reader :user, :deadline, :importance, :status, :tags

  def initialize(params)
    @user = params.dig(:search, :user)
    @deadline = params.dig(:search, :deadline)
    @importance = params.dig(:search, :importance)
    @status = params.dig(:search, :status)
    @tags = params.dig(:search, :tags)
  end

  def filter!
    @tasks = Task.all
    filter_by_user
    filter_by_deadline
    filter_by_tags
    filter_by_status
    filter_by_importance

    @tasks
  end

  private

  def filter_by_user
    return unless user.present?

    @planets = @planets.where(user: user)
  end

  def filter_by_deadline
    return unless deadline.present?

    @planets = @planets.where('deadline <= ?', deadline)
  end

  def filter_by_status
    return unless status.present?

    @planets = @planets.where(tags: tags)
  end

  def filter_by_tags
    return unless tags.present?

    @planets = @planets.where(tags: tags)
  end

  def filter_by_importance
    return unless importance.present?

    @planets = @planets.where('tags <= ?', tags)
  end
end