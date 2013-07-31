class CreatePlots < ActiveRecord::Migration
  def change
    create_table :plots do |t|
      t.integer :project_id
      t.boolean :pick

      t.timestamps
    end
  end
end
