class CreateArrangements < ActiveRecord::Migration
  def change
    create_table :arrangements do |t|
      t.integer :plot_id
      t.integer :stack_id
      t.integer :position

      t.timestamps
    end
  end
end
