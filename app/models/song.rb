class Song < ActiveRecord::Base
  	belongs_to :album
  	acts_as_voteable
    has_many :comments, as: :commentable
  	attr_accessible :featured_artist, :lyrics, :title, :track_number, :artwork, :file
    validates :title,
              presence: true,
              length: {
                minimum: 2, maximum: 40,
                :message => "2-40 characters."
              }
    validates_numericality_of :track_number, allow_blank: true, :only_integer => true, :message => "can only be whole number."

    validates_inclusion_of :track_number, allow_blank: true, :in => 1..100, :message => "can only be between 1 and 120."

    validates :featured_artist,
              allow_blank: true,
              length: {
                minimum: 2, maximum: 40,
                :message => "2-40 characters."
              }
    validates :lyrics,
              allow_blank: true,
              length: {
                minimum: 2, maximum: 1000,
                :message => "2-1000 characters."
              }
  
  	has_attached_file :file,
                    :content_type => ['audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio'],
                    :url => "/system/songs/file/:id/:basename.:extension",
                    :path => ":rails_root/public/system/songs/file/:id/:basename.:extension"

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
