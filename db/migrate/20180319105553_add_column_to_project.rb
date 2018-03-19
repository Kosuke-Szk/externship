class AddColumnToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :opinion, :text
  end
end
