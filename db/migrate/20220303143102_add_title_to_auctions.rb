class AddTitleToAuctions < ActiveRecord::Migration[6.1]
  def change
    add_column :auctions, :title, :string
  end
end
