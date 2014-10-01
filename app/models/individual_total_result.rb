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
# Indexes
#
#  index_individual_total_results_on_user_id  (user_id)
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

# 出塁率=（安打+四球+死球）÷（打数+四球+死球+犠飛）


#打率	安打数÷打数　[小数点４位以下四捨五入]
#出塁率	(四死球＋安打)÷(打数＋四死球＋犠飛)　[小数点４位以下四捨五入]
#長打率	塁打÷打数　[小数点４位以下四捨五入]
#勝率	勝数÷(勝数＋負数)
#防御率	自責点×９÷投球回数　[小数点３位以下四捨五入]
#規定投球回数	試合数×１
#規定打席数	試合数×３．１　[小数点以下切り捨て]
#盗塁成功率	盗塁÷(盗塁＋盗塁死)×１００
#盗塁阻止率	盗塁刺÷(許した盗塁＋盗塁刺)×１００　[小数点２位以下四捨五入]
#打席数	打数＋四死球＋犠打＋犠飛＋妨害出塁
