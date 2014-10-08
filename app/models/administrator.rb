# == Schema Information
#
# Table name: administrators
#
#  id              :integer          not null, primary key
#  login_name      :string(255)      not null
#  hashed_password :string(255)
#  super_user      :boolean          default(FALSE), not null
#  created_at      :datetime
#  updated_at      :datetime
#

class Administrator < ActiveRecord::Base
  include PasswordHolder
end
