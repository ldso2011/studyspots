class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable,  :timeoutable, :confirmable, :lockable, :encryptable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :confirmed_at, :confirmation_sent_at
  
  has_many :userdisciplines, :dependent => :destroy, :foreign_key  => [:discipline_id, :user_id]
  has_many :disciplines, :through => :userdisciplines
  has_many :spots, :through => :userspots
  belongs_to :profile
  validates_uniqueness_of :email
end
