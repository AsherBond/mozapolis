class Playlist < ActiveRecord::Base
  belongs_to :fan
  has_many :ptracks
  attr_accessible :name 
   
  # Friendly URLS
  # -----
  extend FriendlyId
  friendly_id :name, use: :slugged

end
