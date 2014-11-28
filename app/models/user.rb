class User < ActiveRecord::Base
  validates :name, presence: true, length:{minimum: 4,  maximum: 30}
  
  VALID_EMAIL_REGEX = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  validates :email, presence: true, uniqueness: true, length:{maximum: 50}, format: { with: VALID_EMAIL_REGEX }
  
  has_secure_password
  validates :password, length:{minimum: 4}

end
