class Image < ActiveRecord::Base
 	belongs_to :gallery
	has_many :comments, as: :commentable
 	attr_accessible :alt, :title, :file
	has_attached_file :file, :styles => {:small => "260x115#", :medium => "360x215#", :large => "560x415#", :full => "900x900>", :avatar => "60x60#" },
	                  :url => "/system/gallery/images/:id/:style/:basename.:extension",
	                  :path => ":rails_root/public/system/gallery/images/:id/:style/:basename.:extension"
end
