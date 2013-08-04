class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :stack_id
      t.integer :ord

      t.timestamps
    end
  end
end
