class AddAttributesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :description_short, :string
    add_column :projects, :description_long, :text
  end
end
