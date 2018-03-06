class Book < ApplicationRecord
  belongs_to :author
  def self.search(search)
    if search
      where('description  LIKE ? OR name LIKE? OR page_count LIKE?', "%#{search}%","%#{search}%","%#{search}%" )
  	end
  end
end
