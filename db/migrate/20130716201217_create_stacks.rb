class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|
      t.integer :project_id

      t.timestamps
    end
  end
end
