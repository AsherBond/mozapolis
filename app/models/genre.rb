class Genre < ActiveRecord::Base
	has_many :artists
	attr_accessible :name

	def self.tokens(query)
	  genres = where("name like ?", "%#{query}%")
	  if genres.empty?
	    [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
	  else
	    genres
	  end
	end

	def self.ids_from_tokens(tokens)
	  tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
	  tokens.split(',')
	end
end
