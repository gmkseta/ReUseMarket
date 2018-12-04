class ChangeStatusToItem < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :status, :integer, :default => 0
  end
end
