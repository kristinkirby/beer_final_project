class StyleToString < ActiveRecord::Migration[6.0]
  def change
    remove_column :beers, :style_id
    add_column :beers, :style, :string
  end
end
