class AddNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string ,null: false
    add_column :users, :stu_num, :integer,null: false
    add_column :users, :phone_num, :integer,null: false
  end
end
