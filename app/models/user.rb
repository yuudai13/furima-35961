class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
validatable :nickname, :email, :encrypted_password, :last_name_full_width, :first_name_full_width, :last_name_kana_full_width, :first_name_kana_full_width, :birthday, 
# has_many :items, dependent: :destroy
# has_many :purchases, dependent: :destroy
end
