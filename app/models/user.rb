# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  display_name    :string
#  dob             :date
#  email           :string
#  name            :string
#  password_digest :string
#  photo           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  validates :display_name, :uniqueness => { :case_sensitive => false }
  has_secure_password

  has_many(:ratings, { :class_name => "Rating", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:favorites, { :class_name => "Favorite", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:flags, { :class_name => "Flag", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:beers, through: :ratings)


  def avg_rating
    rating = self.ratings
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
