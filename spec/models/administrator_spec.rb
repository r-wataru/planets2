# == Schema Information
#
# Table name: administrators
#
#  id              :integer          not null, primary key
#  login_name      :string(255)
#  password_digest :string(255)      not null
#  super_user      :boolean          default(FALSE), not null
#  created_at      :datetime
#  updated_at      :datetime
#

require 'rails_helper'

RSpec.describe Administrator, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
