# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  beer_id    :integer
#  user_id    :integer
#
class Favorite < ApplicationRecord
  belongs_to(:beer, { :required => false, :class_name => "Beer", :foreign_key => "beer_id" })
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })

  def Favorite.exists?(user_id, beer_id) 
    check = Favorite.where({:beer_id => beer_id}).where({:user_id => user_id}).first
    if check.present?
      return check 
    else
      return false 
    end 
  end

end
