class AddItemImagesToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_images, :json
  end
end
