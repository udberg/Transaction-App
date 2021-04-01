class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :author_id
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
