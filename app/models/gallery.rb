class Gallery < ActiveRecord::Base
	belongs_to :artist
	has_many :images
	has_many :comments, as: :commentable  
	
	# Friendly URLS
	# -----
	extend FriendlyId
	friendly_id :title, use: :slugged

	attr_accessible :description, :title, :cover
	
	validates :title,
	          presence: true,
	          length: {
	            minimum: 2, maximum: 40,
	            :message => "2-40 characters."
	          }
	
	validates :description,
	          allow_blank: true,
	          length: {
	            minimum: 2, maximum: 500,
	            :message => "2-500 characters."
	          }
	validates :cover, :attachment_presence => true
	has_attached_file :cover, 
                      :styles => {
                        :small => "150x150#", 
                        :full_small => "150x150>", 
                        :medium => "400x400#", 
                        :full_medium => "400x400>", 
                        :large => "900x900#", 
                        :full_large => "900x900>",
                        :avatar => "60x60#"
                      },
	                  :url => "/system/galleries/cover/:id/:style/:basename.:extension",
	                  :path => ":rails_root/public/system/galleries/cover/:id/:style/:basename.:extension"
end
