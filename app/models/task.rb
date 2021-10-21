class Task < ApplicationRecord
  belongs_to :user
  has_many :task_tags, dependent: :destroy
  has_many :tags, through: :task_tags

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: %w[to_do done],
                                                  message: "%{value} is not a valid status" }
  validates :importance, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5],
                                                      message: "%{value} is not a valid level of importance" }

end
