# == Schema Information
#
# Table name: individual_results
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  game_id           :integer          not null
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
#  deleted_at        :datetime
#  created_at        :datetime
#  updated_at        :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :individual_result do
  end
end
