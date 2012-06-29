class Song < ActiveRecord::Base
  	belongs_to :album
  	attr_accessible :featured_artist, :lyrics, :title, :track_number, :artwork, :file
  	has_attached_file :file,
                    :content_type => ['audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio'],
                    :url => "/system/songs/file/:id/:basename.:extension",
                    :path => ":rails_root/public/system/songs/file/:id/:basename.:extension"

	has_attached_file :artwork, :styles => {:small => "260x115#", :medium => "360x215#", :large => "560x415#", :full => "900x900>", :avatar => "60x60#" },
	                  :url => "/system/albums/artwork/:id/:style/:basename.:extension",
	                  :path => ":rails_root/public/system/albums/artwork/:id/:style/:basename.:extension"
end
