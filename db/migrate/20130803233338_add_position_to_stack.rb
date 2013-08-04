class AddPositionToStack < ActiveRecord::Migration
  def change
    add_column :stacks, :position, :integer
  end
end
