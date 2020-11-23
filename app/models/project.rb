class Project < ApplicationRecord

  belongs_to :user
  has_many :tasks
  has_many :attachements

   enum project_type: [:Training, :MinProject, :"Medium Project", :"Main Project", :"Ant11 Fantasy Games"]

end
