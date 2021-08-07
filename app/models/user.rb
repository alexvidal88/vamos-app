class User < ApplicationRecord
  has_many :weather_searches
  has_one_attached :photo
  has_many :reviews
  # after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  private
end
