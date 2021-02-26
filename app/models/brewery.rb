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

end
