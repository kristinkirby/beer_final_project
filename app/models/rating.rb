# == Schema Information
#
# Table name: ratings
#
#  id              :integer          not null, primary key
#  rating          :float
#  rating_comments :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  beer_id         :integer
#  user_id         :integer
#
class Rating < ApplicationRecord
  belongs_to(:beer, { :required => false, :class_name => "Beer", :foreign_key => "beer_id" })
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })
 

  def Rating.exists?(user_id, beer_id) 
    check = Rating.where({:beer_id => beer_id}).where({:user_id => user_id}).first
    if check.present?
      return check 
    else
      return false 
    end 
  end

  def avg_rating 
    values = self.map_relation_to_array(:rating)
    if values.present?
      avg = values.sum / values.count
      return avg
    else
      avg = "N/A"
      return avg
    end
  end 

   

end
