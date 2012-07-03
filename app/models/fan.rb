class Fan < ActiveRecord::Base
	has_many :comments, as: :commentable
	has_many :playlists

	# Friendly URLS
	# -----
	extend FriendlyId
	friendly_id :username, use: :slugged

  	is_impressionable
	acts_as_voter
	# Include default devise modules. Others available are:
	# :token_authenticatable, :confirmable,
	# :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :email, :password, :password_confirmation, :remember_me, :profile_image, 
					:first_name, :last_name, :about, :interests, :public_email, :city, :state, :country, :zip, :username
	# attr_accessible :title, :body
	# Validate images.
	# -----
	has_attached_file :profile_image, 
	                  :styles => {
	                    :small => "150x150#", 
	                    :full_small => "150x150>", 
	                    :medium => "400x400#", 
	                    :full_medium => "400x400>", 
	                    :large => "900x900#", 
	                    :full_large => "900x900>",
	                    :avatar => "60x60#"
	                  },
	                  :url => "/system/users/profile_image/:id/:style/:basename.:extension",
	                  :path => ":rails_root/public/system/users/profile_image/:id/:style/:basename.:extension"

end
