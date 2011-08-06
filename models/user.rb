require 'data_mapper'

class User
  include DataMapper::Resource

  property :email, String, :key => true
  property :birthday, Date
  property :username, String
  property :password, String
  property :firstname, String
  property :lastname, String

  validates_with_method :birthday, :method => :check_age

  def check_age
    if self.birthday < Date.today - 18 * 365.25
      true
    else
      [ false, 'Sorry you are ineligible to Sign Up' ]
    end
  end
end
