# == Schema Information
#
# Table name: packages
#
#  id         :integer          not null, primary key
#  content    :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Package < ApplicationRecord

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

end
