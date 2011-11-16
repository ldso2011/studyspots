class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable,  :timeoutable, :confirmable, :lockable, :encryptable

  attr_accessible :email, :password, :password_confirmation, :remember_me
end
