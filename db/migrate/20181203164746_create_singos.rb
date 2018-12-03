class CreateSingos < ActiveRecord::Migration[5.2]
  def change
    create_table :singos do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :sel

      t.timestamps
    end
  end
end
