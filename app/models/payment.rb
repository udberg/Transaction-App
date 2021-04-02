class Payment < ApplicationRecord
  belongs_to :user
  has_many :payments_groups, dependent: :destroy
  has_many :groups, through: :payments_groups

  validates :name, presence: true, length: { minimum: 4, message: 'Transaction name should be at lest 4 letters.' }
  validates :amount, presence: true
end
