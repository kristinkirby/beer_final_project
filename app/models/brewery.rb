# == Schema Information
#
# Table name: breweries
#
#  id           :integer          not null, primary key
#  banner_image :string
#  beers_count  :integer
#  description  :string
#  location     :string
#  logo_image   :string
#  name         :string
#  phone_number :string
#  website      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Brewery < ApplicationRecord

  has_many(:beers, { :class_name => "Beer", :foreign_key => "brewery_id", :dependent => :destroy })
  has_many(:ratings, through: :beers)
  has_many(:favorites, through: :beers)
  has_many(:flags, through: :beers)

  def avg_rating(user_id) 
    rating = self.ratings 
    if user_id
      rating = rating.where({:user_id => user_id})
    end

    values = rating.map_relation_to_array(:rating)
    if values.present?
      avg = values.sum / values.count
      avg = avg.round(3)
      return avg
    else
      avg = "N/A"
      return avg
    end
  end 

end 
