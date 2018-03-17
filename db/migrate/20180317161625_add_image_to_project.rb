class AddImageToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :image, :text
  end
end
