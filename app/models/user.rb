class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :user_info
  accepts_nested_attributes_for :user_info
  
  has_one :user_address
  accepts_nested_attributes_for :user_address
  
  has_many :orders

  # Setup accessible (or protected) attributes for your model
  attr_accessible :user_info, :user_info_attributes, :user_address_attributes, :email, :password, :password_confirmation, :remember_me
  
  after_create :send_welcome_email 
  
  private
  
    def send_welcome_email
      UserMailer.welcome(self).deliver
    end
  
  
end