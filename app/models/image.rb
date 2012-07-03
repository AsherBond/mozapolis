class Image < ActiveRecord::Base
 	belongs_to :gallery
	has_many :comments, as: :commentable
 	attr_accessible :alt, :title, :file
	has_attached_file :file, 
                      :styles => {
                        :small => "150x150#", 
                        :full_small => "150x150>", 
                        :medium => "400x400#", 
                        :full_medium => "400x400>", 
                        :large => "900x900#", 
                        :full_large => "900x900>",
                        :avatar => "60x60#"
                      },
	                  :url => "/system/gallery/images/:id/:style/:basename.:extension",
	                  :path => ":rails_root/public/system/gallery/images/:id/:style/:basename.:extension"

	validates :file, :attachment_presence => true

	validates :title,
	          allow_blank: true, 
	          length: {
	            minimum: 2, maximum: 40,
	            :message => "2-40 characters."
	          }

	validates :alt,
	          allow_blank: true,
	          length: {
	            minimum: 2, maximum: 40,
	            :message => "2-40 characters."
	          }

end
