class CreateApplies < ActiveRecord::Migration[5.1]
  def change
    create_table :applies do |t|
      t.references :project, foreign_key: true
      t.references :company, foreign_key: true
      t.integer    :amount_of_money, null: false, default: 0
      
      t.timestamps
    end
  end
end
