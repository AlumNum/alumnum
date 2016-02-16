class User < ActiveRecord::Base

	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, 
         :omniauthable, :omniauth_providers => [:linkedin]

 	def self.from_omniauth(auth)
 		
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|

        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.type = "Alum"


      end

  end

  # after_create :user_mailer
  # def user_mailer
	 #  UserMailer.welcome_email(self).deliver
  # end
end
