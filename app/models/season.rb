# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  year       :integer          not null
#  name       :string(255)      not null
#  kind       :string(255)      not null
#  use        :boolean          not null
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Season < ActiveRecord::Base
end
