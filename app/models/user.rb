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
end
