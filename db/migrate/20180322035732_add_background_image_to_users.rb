class AddBackgroundImageToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :background_image, :string
  end
end
