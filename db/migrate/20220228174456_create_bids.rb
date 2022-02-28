class CreateBids < ActiveRecord::Migration[6.1]
  def change
    create_table :bids do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :price
      t.references :auction_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
