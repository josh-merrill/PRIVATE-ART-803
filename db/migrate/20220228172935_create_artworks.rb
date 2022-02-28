class CreateArtworks < ActiveRecord::Migration[6.1]
  def change
    create_table :artworks do |t|
      t.string :title
      t.integer :price
      t.references :artist, foreign_key: { to_table: :users }
      t.references :buyer, foreign_key: { to_table: :users }
      t.text :description

      t.timestamps
    end
  end
end
