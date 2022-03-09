class RemoveAddressFromAuction < ActiveRecord::Migration[6.1]
  def change
    remove_column :auctions, :address, :string
    remove_column :auctions, :date, :date
    remove_column :auctions, :status, :string
  end
end
