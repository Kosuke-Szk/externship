class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: {on_delete: :cascade}
      t.integer :target_amount_of_money
      t.integer :current_amount_of_money
      t.text :description

      t.timestamps
    end
  end
end
