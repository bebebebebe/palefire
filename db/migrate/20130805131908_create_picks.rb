class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :stack_id
      t.integer :card_id

      t.timestamps
    end
  end
end
