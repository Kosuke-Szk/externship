class AddColumnToCompany < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :place, :text
  end
end
