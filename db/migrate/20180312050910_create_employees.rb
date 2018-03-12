class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      # t.references :company, foreign_key: true
      t.string :fullname
      t.string :position

      t.timestamps
    end
  end
end
