class Book < ApplicationRecord
  belongs_to :author
  def self.search(search)
    if search
      where('description  LIKE ? OR name LIKE?',"%#{search}%","%#{search}%" )
  	end
  end
end
