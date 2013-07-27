class AddPickToCards < ActiveRecord::Migration
  def change
    add_column :cards, :pick, :boolean
  end
end
