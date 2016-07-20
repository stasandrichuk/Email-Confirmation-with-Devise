class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :timeout_in => 1.hour
  
  include DeviseInvitable::Inviter

  has_many :invitations, :class_name => 'User', :as => :invited_by
end
