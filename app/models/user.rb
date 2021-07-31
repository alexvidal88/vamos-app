class User < ApplicationRecord
  has_many :weather_searches
  has_one_attached :photo
  # after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  private

  # def send_welcome_email
  #   UserMailer.with(user: self).welcome.deliver_now
  # end

end
