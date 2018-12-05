class ChangeStatusToSingo < ActiveRecord::Migration[5.2]
  def change
    change_column :singos, :status, :integer, :default => 0
  end
end
