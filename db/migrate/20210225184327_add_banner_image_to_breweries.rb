class AddBannerImageToBreweries < ActiveRecord::Migration[6.0]
  def change
    add_column :breweries, :banner_image, :string
  end
end
