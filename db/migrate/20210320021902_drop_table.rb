class DropTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :group_transactions
  end

  def down 
    raise ActiveRecord::IrreversibleMigration
  end
end
