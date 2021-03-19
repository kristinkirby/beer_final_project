class AddUserBgColor < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bg_color, :string
  end
end
