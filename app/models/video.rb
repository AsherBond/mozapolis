class Video < ActiveRecord::Base
	belongs_to :artist
	has_many :comments, as: :commentable  
	# Friendly URLS
	# -----
	extend FriendlyId
	friendly_id :title, use: :slugged

	attr_accessible :description, :is_youtube, :title, :youtube_code, :file
	validates :title,
	          presence: true,
	          length: {
	            minimum: 2, maximum: 40,
	            :message => "2-40 characters."
	          }
	validates :youtube_code,
	          allow_blank: true,
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
	has_attached_file :file, 
                    :url => "/system/videos/:id/:basename.:extension",
                    :path => ":rails_root/public/system/videos/:id/:basename.:extension"
	validates :file, :attachment_presence => true

end
