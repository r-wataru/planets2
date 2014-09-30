# == Schema Information
#
# Table name: individual_results
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  season_id         :integer          not null
#  plate_appearances :integer          default(0), not null 打席数
#  at_bats           :integer          default(0), not null 打数
#  single            :integer          default(0), not null シングルヒット
#  double            :integer          default(0), not null ２ベース
#  triple            :integer          default(0), not null ３ベース
#  home_run          :integer          default(0), not null ホームラン
#  base_on_balls     :integer          default(0), not null 四球
#  hit_by_pitches    :integer          default(0), not null 死球
#  sacrifice_bunts   :integer          default(0), not null 犠打
#  sacrifice_flies   :integer          default(0), not null 犠飛
#  errors            :integer          default(0), not null 失策
#  infield_grounder  :integer          default(0), not null 内野ゴロ
#  outfield_grounder :integer          default(0), not null 外野ゴロ
#  infield_fly       :integer          default(0), not null 内野フライ
#  outfield_fly      :integer          default(0), not null 外野フライ
#  infield_linera    :integer          default(0), not null 内野ライナー
#  out_linera        :integer          default(0), not null 外野ライナー
#  strikeouts        :integer          default(0), not null 三振
#  runs_batted_in    :integer          default(0), not null 打点
#  runs_scored       :integer          default(0), not null 得点
#  stolen_bases      :integer          default(0), not null 盗塁
#  deleted_at        :datetime
#  created_at        :datetime
#  updated_at        :datetime
#  

class IndividualResult < ActiveRecord::Base
end
