class Group < ApplicationRecord
  belongs_to :user
  has_many :payments_groups, dependent: :destroy
  has_many :payments, through: :payments_groups

  validates :name, presence: true
  validates :icon, presence: true

  mount_uploader :icon, ImageUploader
end
