# == Schema Information
#
# Table name: pitcher_total_results
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  season_id       :integer          not null
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
# Indexes
#
#  index_pitcher_total_results_on_user_id  (user_id)
#

class PitcherTotalResult < ActiveRecord::Base
end
