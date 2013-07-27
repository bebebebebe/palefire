class DefaultForCardsPick < ActiveRecord::Migration
  def change
    change_column :cards, :pick, :boolean, :default => true
  end
end
