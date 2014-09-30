# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  season_id  :integer          not null
#  name       :string(255)      not null
#  result1    :text
#  result2    :text
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Game, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
