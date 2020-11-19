class Organization < ApplicationRecord
	has_many :users, inverse_of: :organization
end
