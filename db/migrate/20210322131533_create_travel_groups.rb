class CreateTravelGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :travel_groups do |t|
      t.integer :travel_id
      t.integer :group_id

      t.timestamps
    end
    add_index :travel_groups, [:travel_id, :group_id]
  end
end
