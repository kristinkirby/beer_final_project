# == Schema Information
#
# Table name: styles
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string
#  origin      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Style < ApplicationRecord
  has_many(:beers, { :class_name => "Beer", :foreign_key => "style_id", :dependent => :nullify })
end
