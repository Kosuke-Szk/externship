class AddColumnsToUsers2 < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :place, :string
    add_column :users, :school, :string
    add_column :users, :motto, :string
    add_column :users, :description, :text
  end
end
