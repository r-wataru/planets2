# == Schema Information
#
# Table name: emails
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  address    :string(255)      not null
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Emails < ActiveRecord::Base
end
