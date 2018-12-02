class AddReviewToTrade < ActiveRecord::Migration[5.2]
  def change
    add_column :trades, :review_content, :string
    add_column :trades, :score, :integer , default: 0
  end
end
