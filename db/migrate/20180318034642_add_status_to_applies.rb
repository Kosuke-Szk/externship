class AddStatusToApplies < ActiveRecord::Migration[5.1]
  def change
    add_column :applies, :status, :integer, default: 0
  end
end
