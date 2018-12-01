class AddScoreToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :score, :float,default: 0
  end
end
