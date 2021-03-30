class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :travels
  has_many :groups

  has_one_attached :profile_pic

  validates :employee_id, presence: true, uniqueness: { case_sensitive: false }, length: { is: 5 }
  validates :name, presence: true, length: { in: 2..40 }
end
