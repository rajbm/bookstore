class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :description,:author_id
  has_one :author
end
