class Attachement < ApplicationRecord
  belongs_to :project
  has_attached_file :image,
  					:url  => "../assets/images/:id/:style/:basename.:extension",
			        :path => "project_attachement/:id/:style/:basename.:extension",
			        default_url: "Users/pavan/sykam_pms/app/assets/images/exp.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/]



end
