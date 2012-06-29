class Comment < ActiveRecord::Base
  
  # Relationships
  # -------------
  belongs_to :fan
  belongs_to :artist
  belongs_to :commentable, polymorphic: true
  
  # MASS ASSIGNMENT
  # ---------------
  attr_accessible :content
  
  # Validations
  # -------------
  validates :content,
	        presence: true,
	        length: {
	          minimum: 2, maximum: 250,
	          :message => "you have exceded 250 letters"
	        }
end
