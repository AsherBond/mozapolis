class Event < ActiveRecord::Base
  
  # Relationships
  # -------------
  belongs_to :artist
  has_many :comments, as: :commentable
  
  # Friendly URLS
  # -----
  extend FriendlyId
  friendly_id :title, use: :slugged

  # MASS ASSIGNMENT
  # ---------------
  attr_accessible :about, :end, :start, :ticket_cost, :title, :photo
  
  # Validations
  # -----------
  validates :title,
          presence: true,
          length: {
            minimum: 2, maximum: 40,
            :message => "is too short"
          }  

  validates :start, presence: true
  validates :end, presence: true

  validates :about,
            presence: true,
            length: {
              minimum: 2, maximum: 250,
              :message => "you have exceded 250 letters"
            }
  has_attached_file :photo, 
                      :styles => {
                        :small => "150x150#", 
                        :full_small => "150x150>", 
                        :medium => "400x400#", 
                        :full_medium => "400x400>", 
                        :large => "900x900#", 
                        :full_large => "900x900>",
                        :avatar => "60x60#"
                      },
                    :url => "/system/articles/photos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/articles/photos/:id/:style/:basename.:extension"
end
