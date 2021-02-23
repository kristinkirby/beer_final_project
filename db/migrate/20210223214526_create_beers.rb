class CreateBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :brewery_id
      t.string :abv
      t.string :ibu
      t.string :description
      t.string :image
      t.integer :style_id

      t.timestamps
    end
  end
end
