class Ptrack < ActiveRecord::Base
  belongs_to :playlist
  attr_accessible :song_id
end
