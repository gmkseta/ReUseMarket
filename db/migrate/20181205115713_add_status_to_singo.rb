class AddStatusToSingo < ActiveRecord::Migration[5.2]
  def change
    add_column :singos, :status, :integer
  end
end
