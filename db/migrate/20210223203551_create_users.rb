class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :display_name
      t.string :name
      t.string :photo
      t.date :dob

      t.timestamps
    end
  end
end
