class ChangeRatingType < ActiveRecord::Migration[6.0]
  def change
    change_column :ratings, :rating, :float
  end
end
