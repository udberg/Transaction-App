class GroupsTransaction < ApplicationRecord
  belongs_to :group
  belongs_to :my_transactions, class_name: 'Transaction'
end
