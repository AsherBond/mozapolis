class Album < ActiveRecord::Base
  	has_many :songs
	has_many :comments, as: :commentable
  	belongs_to :artist

	# Friendly URLS
	# -----
	extend FriendlyId
	friendly_id :title, use: :slugged

  	acts_as_list
  	acts_as_voteable
  	is_impressionable
  	attr_accessible :description, :label, :title, :year, :artwork

	# Validations
	# -----------
	validates :label, 
			  allow_blank: true,
	          length: { 
	            minimum: 2, maximum: 40, 
	            :message => "2-40 characters." 
	          }

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

	validates_numericality_of :year, :only_integer => true, :message => "can only be whole number."

	validates_inclusion_of :year, :in => 1900..2099, :message => "can only be between 1900 and 2099."

	has_attached_file :artwork, 
                      :styles => {
                        :small => "150x150#", 
                        :full_small => "150x150>", 
                        :medium => "400x400#", 
                        :full_medium => "400x400>", 
                        :large => "900x900#", 
                        :full_large => "900x900>",
                        :avatar => "60x60#"
                      },
	                  :url => "/system/albums/artwork/:id/:style/:basename.:extension",
	                  :path => ":rails_root/public/system/albums/artwork/:id/:style/:basename.:extension"
end
