class User < ActiveRecord::Base
  has_secure_password

  enum role: [ :admin, :curator, :cataloguer ]
end
