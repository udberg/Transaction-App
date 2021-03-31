class Transaction < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }

  belongs_to :user
  has_and_belongs_to_many :groups

  scope :user_transac, ->(u_id) { where(user_id: u_id).select('id, name, amount, created_at') }
  scope :sum_amount, ->(u_id) { where(user_id: u_id).select('id, name, amount, created_at').sum('amount') }
  scope :ext_transaction, -> { where(author_id: nil) }
end
