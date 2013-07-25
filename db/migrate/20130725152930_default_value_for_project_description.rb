class DefaultValueForProjectDescription < ActiveRecord::Migration
  def change
    change_column_default(:projects, :description_short, nil)
  end
end
