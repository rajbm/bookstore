class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone_number, :country
end
