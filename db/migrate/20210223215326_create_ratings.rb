class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :beer_id
      t.string :rating
      t.string :rating_comments

      t.timestamps
    end
  end
end
