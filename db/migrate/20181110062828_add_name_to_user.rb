class AddNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :stu_num, :integer
    add_column :users, :phone_num, :integer
  end
end
