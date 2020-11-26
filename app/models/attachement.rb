class Attachement < ApplicationRecord
  belongs_to :project
  has_attached_file :image

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/]

end
