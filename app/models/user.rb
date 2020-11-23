class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :organization
  has_many :projects
  # has_many :tasks
  # has_attached_file :profile_pic, default_url: "/images/:style/missing.png"

  # validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\z/

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  
  validates :first_name, presence: true,length: { minimum: 3, maximum: 15 }, format: {with: /\A[a-zA-Z]+\z/, message:"only allows letters"}
	validates :last_name, presence: true,length: { minimum: 3, maximum: 15 }, format: {with: /\A[a-zA-Z]+\z/, message:"only allows letters"}
	validates :user_name, presence: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
	validates :mobile, uniqueness: true, presence: true,length: { minimum: 10, maximum: 10 }, format: {with: /\d[0-9]\)*\z/, message:"Only positive number without spaces are allowed"}
  # validates :password, presence: true
  # validates_confirmation_of :password
  

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,:lockable, :timeoutable
end