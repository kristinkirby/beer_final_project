# == Schema Information
#
# Table name: beers
#
#  id          :integer          not null, primary key
#  abv         :string
#  description :string
#  ibu         :string
#  image       :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  brewery_id  :integer
#  style_id    :integer
#
class Beer < ApplicationRecord

  has_many(:ratings, { :class_name => "Rating", :foreign_key => "beer_id", :dependent => :destroy })
  has_many(:favorites, { :class_name => "Favorite", :foreign_key => "beer_id", :dependent => :destroy })
  has_many(:flags, { :class_name => "Flag", :foreign_key => "beer_id", :dependent => :destroy })
  belongs_to(:brewery, { :required => false, :class_name => "Brewery", :foreign_key => "brewery_id", :counter_cache => true })
  belongs_to(:style, { :required => false, :class_name => "Style", :foreign_key => "style_id" })

  # def avg_rating(by_user)
  #   rating = self.ratings
  #   if by_user
  #     rating = rating.where({:user_id => session.fetch(:user_id)})
  #   end

  #   values = rating.map_relation_to_array(:rating)

  #   avg = values.sum / values.count
  #   return avg

  # end 


end
