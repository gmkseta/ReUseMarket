class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.references :seller
      t.references :customer
      t.references :item, foreign_key: true
      t.integer :status,default: 0

      t.timestamps
    end
  end
end
