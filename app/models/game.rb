# == Schema Information
#
# Table name: games
#
#  id                :integer          not null, primary key
#  season_id         :integer          not null
#  name              :string(255)      not null
#  result1           :text
#  result2           :text
#  plate_appearances :integer          default(0), not null
#  at_bats           :integer          default(0), not null
#  single            :integer          default(0), not null
#  double            :integer          default(0), not null
#  triple            :integer          default(0), not null
#  home_run          :integer          default(0), not null
#  base_on_balls     :integer          default(0), not null
#  hit_by_pitches    :integer          default(0), not null
#  sacrifice_bunts   :integer          default(0), not null
#  sacrifice_flies   :integer          default(0), not null
#  errors            :integer          default(0), not null
#  infield_grounder  :integer          default(0), not null
#  outfield_grounder :integer          default(0), not null
#  infield_fly       :integer          default(0), not null
#  outfield_fly      :integer          default(0), not null
#  infield_linera    :integer          default(0), not null
#  out_linera        :integer          default(0), not null
#  strikeouts        :integer          default(0), not null
#  runs_batted_in    :integer          default(0), not null
#  runs_scored       :integer          default(0), not null
#  stolen_bases      :integer          default(0), not null
#  pitching_number   :integer          default(0), not null
#  hit               :integer          default(0), not null
#  run               :integer          default(0)
#  created_at        :datetime
#  updated_at        :datetime
#
# Indexes
#
#  index_games_on_season_id  (season_id)
#

class Game < ActiveRecord::Base
  
end
