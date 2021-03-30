class Travel < ApplicationRecord
  belongs_to :user

  has_many :travel_groups, dependent: :destroy
  has_many :groups, through: :travel_groups

  validates :purpose, presence: true, length: { in: 4..40 }
  validates :source, presence: true, length: { in: 2..20 }
  validates :destination, presence: true, length: { in: 2..20 }
  validates :distance, presence: true

  scope :recent_first, -> { order('created_at DESC') }
end
