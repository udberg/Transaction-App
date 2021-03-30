class Group < ApplicationRecord
  has_one_attached :icon

  belongs_to :user

  has_many :travel_groups, dependent: :destroy
  has_many :travels, through: :travel_groups

  scope :alphabetically, -> { order('name') }

  validates :name, presence: true, length: { in: 4..40 }
end
