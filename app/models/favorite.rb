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
end
