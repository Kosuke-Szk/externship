class AddToProjectTitle < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :title, :string, null: false, default: 'Unknown'
  end
end
