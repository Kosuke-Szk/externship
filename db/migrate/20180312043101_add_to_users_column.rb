class AddToUsersColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fullname, :string, null: false, default: ""
    add_column :users, :image,    :string, null: false, default: ""
  end
end
