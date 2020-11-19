class Project < ApplicationRecord
  belongs_to :user
   enum project_type: [:Ant11_Fantasy_Games, :Bitcoin_India, :Sykam_PMS, :Red_Lorry]
end
