class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :writing
      t.integer :stack_id

      t.timestamps
    end
  end
end
