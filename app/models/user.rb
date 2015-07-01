require 'random_hash'

class User < ActiveRecord::Base
  has_secure_password

  enum role: [ :cataloguer, :curator, :admin ]
end
