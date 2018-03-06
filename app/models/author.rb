class Author < ApplicationRecord
	has_many :books
	def self.search(search)
	 	if search
	    	where('name  LIKE ? OR email LIKE? OR phone_number LIKE? OR country LIKE?', "%#{search}%","%#{search}%","%#{search}%","%#{search}%" )
		end
	end
end
