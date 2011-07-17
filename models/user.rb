require 'data_mapper'

# If you want the logs displayed you have to do this before the call to setup
DataMapper::Logger.new($stdout, :debug)

# An in-memory Sqlite3 connection:
DataMapper.setup(:default, 'sqlite::memory:')

class User
  include DataMapper::Resource

  property :email, String, :key => true
  property :username, String
  property :password, String
end

DataMapper.finalize

# Automatically create the tables if they don't exist
DataMapper.auto_migrate!
