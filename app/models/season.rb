# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  year       :integer          not null
#  name       :string(255)      not null
#  kind       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Season < ActiveRecord::Base
end