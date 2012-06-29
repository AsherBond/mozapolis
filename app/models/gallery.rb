class Gallery < ActiveRecord::Base
	belongs_to :artist
	has_many :images
	has_many :comments, as: :commentable
	attr_accessible :description, :title, :cover
	has_attached_file :cover, :styles => {:small => "260x115#", :medium => "360x215#", :large => "560x415#", :full => "900x900>", :avatar => "60x60#" },
	                  :url => "/system/galleries/cover/:id/:style/:basename.:extension",
	                  :path => ":rails_root/public/system/galleries/cover/:id/:style/:basename.:extension"
end
