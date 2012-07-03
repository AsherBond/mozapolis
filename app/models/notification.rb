class Notification < ActiveRecord::Base
  belongs_to :fan
  belongs_to :artist
  attr_accessible :message, :object_id, :object_type, :read, :for
end
