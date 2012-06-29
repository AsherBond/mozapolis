# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120629153147) do

  create_table "albums", :force => true do |t|
    t.string   "title"
    t.integer  "year"
    t.string   "label"
    t.text     "description"
    t.integer  "artist_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "artwork_file_name"
    t.string   "artwork_content_type"
    t.integer  "artwork_file_size"
    t.datetime "artwork_updated_at"
    t.integer  "position"
  end

  add_index "albums", ["artist_id"], :name => "index_albums_on_artist_id"

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.integer  "artist_id"
    t.text     "content"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "articles", ["artist_id"], :name => "index_articles_on_artist_id"

  create_table "artists", :force => true do |t|
    t.string   "email",                                  :default => "",    :null => false
    t.string   "encrypted_password",                     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.text     "about"
    t.string   "website"
    t.boolean  "paid",                                   :default => false
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.string   "artist_name"
    t.string   "username"
    t.string   "public_email"
    t.string   "body_background_color"
    t.string   "body_background_repeat"
    t.string   "body_background_position"
    t.string   "body_background_attachment"
    t.string   "main_artist_name_color"
    t.string   "main_artist_info_color"
    t.string   "main_artist_location_color"
    t.string   "main_background_color"
    t.string   "main_background_repeat"
    t.string   "main_background_position"
    t.string   "main_background_attachment"
    t.string   "news_header_color"
    t.string   "news_text_color"
    t.string   "news_link_color"
    t.string   "news_link_hover_color"
    t.string   "news_background_color"
    t.string   "news_background_repeat"
    t.string   "news_background_position"
    t.string   "news_background_attachment"
    t.string   "about_header_color"
    t.string   "about_text_color"
    t.string   "about_link_color"
    t.string   "about_link_hover_color"
    t.string   "about_background_color"
    t.string   "about_background_repeat"
    t.string   "about_background_position"
    t.string   "about_background_attachment"
    t.string   "comments_header_color"
    t.string   "comments_text_color"
    t.string   "comments_link_color"
    t.string   "comments_link_hover_color"
    t.string   "comments_background_color"
    t.string   "comments_background_repeat"
    t.string   "comments_background_position"
    t.string   "comments_background_attachment"
    t.string   "thumbnails_background_color"
    t.string   "thumbnails_background_hover_color"
    t.string   "thumbnails_border_color"
    t.string   "thumbnails_border_hover_color"
    t.string   "tables_border_color"
    t.string   "tables_header_color"
    t.string   "tables_header_background_color"
    t.string   "tables_row_text_color"
    t.string   "tables_row_background_color"
    t.string   "tables_row_background_hover_color"
    t.string   "nav_current_text_color"
    t.string   "nav_current_background_color"
    t.string   "nav_text_color"
    t.string   "nav_text_hover_color"
    t.string   "nav_background_color"
    t.string   "nav_background_hover_color"
    t.string   "tables_link_color"
    t.string   "tables_link_hover_color"
    t.string   "thumbnails_link_color"
    t.string   "thumbnails_link_hover_color"
    t.string   "slug"
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.string   "thumbnails_text_color"
    t.string   "body_background_image_file_name"
    t.string   "body_background_image_content_type"
    t.integer  "body_background_image_file_size"
    t.datetime "body_background_image_updated_at"
    t.string   "main_background_image_file_name"
    t.string   "main_background_image_content_type"
    t.integer  "main_background_image_file_size"
    t.datetime "main_background_image_updated_at"
    t.string   "news_background_image_file_name"
    t.string   "news_background_image_content_type"
    t.integer  "news_background_image_file_size"
    t.datetime "news_background_image_updated_at"
    t.string   "comments_background_image_file_name"
    t.string   "comments_background_image_content_type"
    t.integer  "comments_background_image_file_size"
    t.datetime "comments_background_image_updated_at"
    t.string   "about_background_image_file_name"
    t.string   "about_background_image_content_type"
    t.integer  "about_background_image_file_size"
    t.datetime "about_background_image_updated_at"
  end

  add_index "artists", ["email"], :name => "index_artists_on_email", :unique => true
  add_index "artists", ["reset_password_token"], :name => "index_artists_on_reset_password_token", :unique => true
  add_index "artists", ["slug"], :name => "index_artists_on_slug", :unique => true

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.string   "poster_type"
    t.integer  "artist_id"
    t.integer  "fan_id"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "comments", ["artist_id"], :name => "index_comments_on_artist_id"
  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["fan_id"], :name => "index_comments_on_fan_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "start"
    t.datetime "end"
    t.integer  "ticket_cost"
    t.text     "about"
    t.integer  "artist_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "events", ["artist_id"], :name => "index_events_on_artist_id"

  create_table "fans", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "fans", ["email"], :name => "index_fans_on_email", :unique => true
  add_index "fans", ["reset_password_token"], :name => "index_fans_on_reset_password_token", :unique => true

  create_table "galleries", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "artist_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
  end

  add_index "galleries", ["artist_id"], :name => "index_galleries_on_artist_id"

  create_table "images", :force => true do |t|
    t.string   "title"
    t.string   "alt"
    t.integer  "gallery_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "images", ["gallery_id"], :name => "index_images_on_gallery_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "nav_title"
    t.text     "meta_description"
    t.integer  "position"
    t.text     "content"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "songs", :force => true do |t|
    t.integer  "album_id"
    t.string   "title"
    t.text     "lyrics"
    t.integer  "track_number"
    t.string   "featured_artist"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "artwork_file_name"
    t.string   "artwork_content_type"
    t.integer  "artwork_file_size"
    t.datetime "artwork_updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "songs", ["album_id"], :name => "index_songs_on_album_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "thumbnails_text_color"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "is_youtube"
    t.string   "youtube_code"
    t.integer  "artist_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "videos", ["artist_id"], :name => "index_videos_on_artist_id"

end
