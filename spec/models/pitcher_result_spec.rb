# == Schema Information
#
# Table name: pitcher_results
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  game_id         :integer          not null
#  pitching_number :integer          default(0), not null
#  hit             :integer          default(0), not null
#  run             :integer          default(0), not null
#  remorse_point   :integer          default(0), not null
#  strikeouts      :integer          default(0), not null
#  winning         :integer          default(0), not null
#  defeat          :integer          default(0), not null
#  hold_number     :integer          default(0), not null
#  save_number     :integer          default(0), not null
#  deleted_at      :datetime
#  created_at      :datetime
#  updated_at      :datetime
#

require 'rails_helper'

RSpec.describe PitcherResult, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
