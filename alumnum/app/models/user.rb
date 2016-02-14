class User < ActiveRecord::Base

	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :user_mailer
  def user_mailer
	  UserMailer.send_welcome_message(self).deliver
  end
end
