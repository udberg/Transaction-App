class CreateTravels < ActiveRecord::Migration[6.1]
  def change
    create_table :travels do |t|
      t.string :purpose
      t.string :source
      t.string :destination
      t.integer :distance
      t.integer :user_id

      t.timestamps
    end
    add_index :travels, :user_id
  end
end
