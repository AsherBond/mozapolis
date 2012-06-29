class Album < ActiveRecord::Base
  	has_many :songs
	has_many :comments, as: :commentable
  	belongs_to :artist
  	acts_as_list
  	attr_accessible :description, :label, :title, :year, :artwork

	# Validations
	# -----------
	validates :label, 
	          presence: true, 
	          length: { 
	            minimum: 2, maximum: 40, 
	            :message => "is too short" 
	          }

	validates :title,
	          presence: true,
	          length: {
	            minimum: 2, maximum: 40,
	            :message => "is too short"
	          }

	validates_numericality_of :year, :only_integer => true, :message => "can only be whole number."

	validates_inclusion_of :year, :in => 1900..2099, :message => "can only be between 1900 and 2099."

	has_attached_file :artwork, :styles => {:small => "260x115#", :medium => "360x215#", :large => "560x415#", :full => "900x900>", :avatar => "60x60#" },
	                  :url => "/system/albums/artwork/:id/:style/:basename.:extension",
	                  :path => ":rails_root/public/system/albums/artwork/:id/:style/:basename.:extension"
end
