class Statement < ApplicationRecord
  belongs_to :wallets
  belongs_to :withdraws
  belongs_to :deposits

  enum statement: { pending: 0, cancel: 1, approved: 2 }

end
