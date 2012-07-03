class Artist < ActiveRecord::Base

	has_many :albums
  has_many :genres
  has_many :galleries
  has_many :articles
  has_many :events
	has_many :videos
	has_many :comments, as: :commentable
  has_many :notifications

  # Friendly URLS
  # -----
  extend FriendlyId
  friendly_id :username, use: :slugged

  acts_as_voter
  is_impressionable

	# Include default devise modules. Others available are:
	# :token_authenticatable, :confirmable,
	# :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

  # MASS ASSIGNMENT
  # ---------------
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
  				  :first_name, :last_name, :username, :about, :website, :paid, :genre_tokens,
            :city, :state, :country, :zip, :artist_name, :public_email, :profile_image, :interests,
            :body_background_image, 
            :body_background_color, 
            :body_background_repeat, 
            :body_background_position, 
            :body_background_attachment,
            :main_artist_name_color, 
            :main_artist_info_color, 
            :main_artist_location_color, 
            :main_background_image, 
            :main_background_color, 
            :main_background_repeat, 
            :main_background_position, 
            :main_background_attachment,
            :news_header_color, 
            :news_text_color, 
            :news_link_color, 
            :news_link_hover_color, 
            :news_background_image, 
            :news_background_color, 
            :news_background_repeat, 
            :news_background_position, 
            :news_background_attachment,
            :about_header_color, 
            :about_text_color, 
            :about_link_color, 
            :about_link_hover_color, 
            :about_background_image, 
            :about_background_color, 
            :about_background_repeat, 
            :about_background_position, 
            :about_background_attachment,
            :comments_header_color, 
            :comments_text_color, 
            :comments_link_color, 
            :comments_link_hover_color, 
            :comments_background_image, 
            :comments_background_color, 
            :comments_background_repeat, 
            :comments_background_position, 
            :comments_background_attachment,
            :thumbnails_background_color,
            :thumbnails_background_hover_color,
            :thumbnails_link_color,
            :thumbnails_link_hover_color,
            :thumbnails_border_color,
            :thumbnails_border_hover_color,
            :thumbnails_text_color,
            :tables_border_color,
            :tables_link_color,
            :tables_link_hover_color,
            :tables_header_color, 
            :tables_row_text_color,
            :tables_header_background_color,
            :tables_row_background_color,
            :tables_row_background_hover_color,
            :nav_current_text_color,
            :nav_current_background_color,
            :nav_text_color,
            :nav_text_hover_color,
            :nav_background_color,
            :nav_background_hover_color

  attr_reader :genre_tokens

  def genre_tokens=(tokens)
    self.genre_ids = Genre.ids_from_tokens(tokens)
  end
  # Valid email regex.
  # -----
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Validate the current users email with a regex.
  # -----
  validates :email,
            presence: true,
            format: {with: VALID_EMAIL_REGEX, :message => "is not a valid email"},

            uniqueness: {case_sensitive: false, :message => "is already registered"}

  validates :public_email,
            :allow_nil => true, :allow_blank => true,
            format: {with: VALID_EMAIL_REGEX, :message => "is not a valid email"}

  # Edit profile validations
  validates :first_name,
            presence: true,
            length: {
                minimum: 2, maximum: 40,
                :message => "is too short"
            }

  validates :last_name,
            presence: true,
            length: {
                minimum: 2, maximum: 40,
                :message => "is too short"
            }

  validates :username,
            presence: true,
            length: {
                minimum: 3, maximum: 25,
                :message => "must be inbetween 3-25 characters"
            },
            uniqueness: {case_sensitive: false, :message => 'is taken :('}

  validates :artist_name,
            presence: true,
            length: {
                minimum: 3, maximum: 25,
                :message => "must be inbetween 3-25 characters"
            },
            uniqueness: {case_sensitive: false, :message => 'is taken :('}

  # Validate images.
  # -----
  has_attached_file :profile_image, 
                    :styles => {
                      :small => "150x150#", 
                      :full_small => "150x150>", 
                      :medium => "400x400#", 
                      :full_medium => "400x400>", 
                      :large => "900x900#", 
                      :full_large => "900x900>",
                      :avatar => "60x60#"
                    },
                    :url => "/system/users/profile_image/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/users/profile_image/:id/:style/:basename.:extension"

  has_attached_file :news_background_image, :styles => {:small => "150x150>"},
                    :url => "/system/users/news_background_image/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/users/news_background_image/:id/:style/:basename.:extension"

  has_attached_file :comments_background_image, :styles => {:small => "150x150>"},
                    :url => "/system/users/comments_background_image/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/users/comments_background_image/:id/:style/:basename.:extension"

  has_attached_file :about_background_image, :styles => {:small => "150x150>"},
                    :url => "/system/users/about_background_image/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/users/about_background_image/:id/:style/:basename.:extension"

  has_attached_file :main_background_image, :styles => {:small => "150x150>"},
                    :url => "/system/users/main_box_background_image/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/users/main_box_background_image/:id/:style/:basename.:extension"

  has_attached_file :body_background_image, :styles => {:small => "150x150>"},
                    :url => "/system/users/body_background/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/users/body_background/:id/:style/:basename.:extension"


  private

    def define_role
      self.add_role :artist
    end
end
