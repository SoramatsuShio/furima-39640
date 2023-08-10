class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         # app/models/user.rb

  validates :nickname, presence: true
  validates :family_name_zenkaku, presence: true
  validates :first_name_zenkaku, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :date_of_birth, presence: true
end





