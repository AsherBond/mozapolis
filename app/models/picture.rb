class Picture < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  image_accessor :avatar

  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "name" => read_attribute(:avatar_name),
      "size" => avatar.size,
      "url" => avatar.url,
      "thumbnail_url" => avatar.thumb('80x80#').url,
      "delete_url" => picture_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end
end