class Group < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :icon, presence: true

  has_and_belongs_to_many :my_transactions, class_name: 'Transaction', foreignkey: 'group_id'
  belongs_to :user
end
