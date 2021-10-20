class Tag < ApplicationRecord
  belongs_to :user
  belongs_to :task, optional: true

  validates :name, presence: true
  validates_uniqueness_of :name, scope: :user
end
