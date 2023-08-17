class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
    
  validates :nickname,presence: true
  validates :family_name_zenkaku, presence: true
  validates :first_name_zenkaku, presence: true
  validates :family_name_kana, presence: true 
  validates :first_name_kana, presence: true 
  validates :date_of_birth, presence: true


  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
    validates :first_name_zenkaku
    validates :family_name_zenkaku
  end
  

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' } do
    validates :first_name_kana
    validates :family_name_kana
  end


  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers' }

  
end

