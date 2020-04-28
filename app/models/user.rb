class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :muscles, dependent: :destroy
  attachment :user_image, destroy: false
  has_many :favorites, dependent: :destroy
  has_many :muscle_comments, dependent: :destroy
end
