class WorkOrder < ApplicationRecord

  belongs_to :equipment
  belongs_to :requestor, class_name: 'User'
  belongs_to :reviewer, class_name: 'User', optional: true
  belongs_to :approver, class_name: 'User', optional: true
  belongs_to :closer, class_name: 'User', optional: true

  validates :inspected_at, :priority, :description, :status, presence: true
end
