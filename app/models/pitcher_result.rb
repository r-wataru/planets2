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
# Indexes
#
#  index_pitcher_results_on_user_id  (user_id)
#

class PitcherResult < ActiveRecord::Base
end

#  pitching_number 投球回
#  hit             被安打
#  run             失点
#  remorse_point   自責点
#  strikeouts      三振
#  winning         勝
#  defeat          負
#  hold_number     ホールド
#  save_number     セーブ
