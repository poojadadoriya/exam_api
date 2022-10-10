class Api::V1::UserSerializer < ActiveModel::Serializer
  
  #attributes :id, :username, :picture, :frist_name, :last_name, :age, :date_of_birth, :address, :experince, :technology
  
   
  attributes :picture do |obj|
    rails_blob_path(obj.picture)
  end
end