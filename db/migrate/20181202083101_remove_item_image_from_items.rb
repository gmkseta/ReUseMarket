class RemoveItemImageFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :item_image, :string
  end
end
