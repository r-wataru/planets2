# == Schema Information
#
# Table name: individual_total_results
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  season_id         :integer          not null
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

class IndividualTotalResult < ActiveRecord::Base
end

#  plate_appearances 打席数
#  at_bats           打数
#  single            シングルヒット
#  double            ２ベース
#  triple            ３ベース
#  home_run          ホームラン
#  base_on_balls     四球
#  hit_by_pitches    死球
#  sacrifice_bunts   犠打
#  sacrifice_flies   犠飛
#  errors            失策
#  infield_grounder  内野ゴロ
#  outfield_grounder 外野ゴロ
#  infield_fly       内野フライ
#  outfield_fly      外野フライ
#  infield_linera    内野ライナー
#  out_linera        外野ライナー
#  strikeouts        三振
#  runs_batted_in    打点
#  runs_scored       得点
#  stolen_bases      盗塁
