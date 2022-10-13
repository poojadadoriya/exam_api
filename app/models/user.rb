class User < ApplicationRecord
	has_secure_password
	belongs_to :company
	has_many :help_supports
	  # validates :email, presence: true, uniqueness: true
	  # validates :username, presence: true
	has_one_attached :picture
	


end