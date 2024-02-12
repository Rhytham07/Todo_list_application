class Task < ApplicationRecord
  belongs_to :user
  has_many :sub_tasks, dependent: :destroy

  accepts_nested_attributes_for :sub_tasks
end