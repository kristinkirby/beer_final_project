class CreateBreweries < ActiveRecord::Migration[6.0]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :location
      t.string :phone_number
      t.string :website
      t.string :logo_image
      t.string :description
      t.integer :beers_count

      t.timestamps
    end
  end
end
