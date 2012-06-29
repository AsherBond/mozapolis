class Page < ActiveRecord::Base
  attr_accessible :content, :meta_description, :nav_title, :position, :title
end
