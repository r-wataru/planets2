# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  year       :integer          not null
#  name       :string(255)      not null
#  kind       :string(255)      not null
#  use        :boolean          not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Season, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
