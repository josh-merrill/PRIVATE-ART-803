class CreateAuctionItems < ActiveRecord::Migration[6.1]
  def change
    create_table :auction_items do |t|
      t.references :artwork, null: false, foreign_key: true
      t.references :auction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
