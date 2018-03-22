class AddMessageToApplies < ActiveRecord::Migration[5.1]
  def change
    add_column :applies, :message, :text
  end
end
