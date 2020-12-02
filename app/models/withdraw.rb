class Withdraw < ApplicationRecord
  belongs_to :user
  has_one :statement
  # enum status: [:Pending, :Cancel, :"Approved"]
  enum status: { pending: 0, cancel: 1, approved: 2 }
end
