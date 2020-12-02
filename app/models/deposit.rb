class Deposit < ApplicationRecord
  belongs_to :user
  has_one :statement
  # enum status: [:pending, :cancel, :"approved"]
  enum status: { pending: 0, cancel: 1, approved: 2 }
  validates :amount, presence: true

  before_save do 
  	self.amount = "300" if status.to_s == "approved"
  end

end
