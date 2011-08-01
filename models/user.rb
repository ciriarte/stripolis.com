require 'data_mapper'

class User
  include DataMapper::Resource

  property :email, String, :key => true
  property :dob, Date
  property :username, String
  property :password, String
  property :firstname, String
  property :lastname, String
end
