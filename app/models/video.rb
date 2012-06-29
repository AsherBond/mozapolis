class Video < ActiveRecord::Base
  belongs_to :artist
  has_many :comments, as: :commentable
  attr_accessible :description, :is_youtube, :title, :youtube_code, :file

  has_attached_file :file, 
                    :url => "/system/videos/:id/:basename.:extension",
                    :path => ":rails_root/public/system/videos/:id/:basename.:extension"

end
