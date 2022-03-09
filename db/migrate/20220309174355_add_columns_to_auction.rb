class AddColumnsToAuction < ActiveRecord::Migration[6.1]
  def change
    add_column :auctions, :address, :string
    add_column :auctions, :date, :date
  end
end
