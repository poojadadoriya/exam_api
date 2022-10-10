class User < ApplicationRecord
	has_secure_password
	belongs_to :company
	  # validates :email, presence: true, uniqueness: true
	  # validates :username, presence: true
	has_one_attached :picture
	#after_create :welcome_email


end