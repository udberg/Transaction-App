class CreateGroupsTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :groups_transactions do |t|
      t.references :group, null: false, foreign_key: true
      t.references :transaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
