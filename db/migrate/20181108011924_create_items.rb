class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.integer :price
      t.string :item_image
      t.integer :category

      t.timestamps
    end
  end
end
