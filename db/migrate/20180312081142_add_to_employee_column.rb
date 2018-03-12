class AddToEmployeeColumn < ActiveRecord::Migration[5.1]
  def change
    add_reference :employees, :company, index: true
  end
end
