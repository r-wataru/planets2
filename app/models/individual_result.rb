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
# Indexes
#
#  index_individual_results_on_user_id  (user_id)
#

require 'csv'
require "kconv"
require 'nkf'

class IndividualResult < ActiveRecord::Base
  class << self
    def import_csv
      path = Rails.root.join("db", "seeds", "data", "mla_export_p_batter.csv")
      if File.exists?(path)
        file = path.read
        data = NKF::nkf('-w', file)
        csv = CSV.new(data)
        csv.each_with_index do |arr, idx|
          data_arr = arr[0].split(";")
          if User.exists?(display_name: data_arr[2])
            puts data_arr[2]
            user = User.find_by_display_name(data_arr[2])
            puts "aaaa"
            user.individual_results.new(
              plate_appearances: data_arr[3].to_i,
              at_bats: data_arr[4].to_i,
              single: data_arr[5].to_i,
              double: data_arr[6].to_i,
              triple: data_arr[7].to_i,
              home_run: data_arr[8].to_i,
              base_on_balls: data_arr[9].to_i,
              hit_by_pitches: data_arr[9].to_i,
              sacrifice_bunts: data_arr[10].to_i,
              sacrifice_flies: data_arr[11].to_i,
              errors: data_arr[12].to_i,
              infield_grounder: data_arr[13].to_i,
              outfield_grounder: data_arr[14].to_i,
              infield_fly: data_arr[15].to_i,
              outfield_fly: data_arr[16].to_i,
              infield_linera: data_arr[16].to_i,
              out_linera: data_arr[17].to_i,
              strikeouts: data_arr[18].to_i,
              runs_batted_in: data_arr[19].to_i,
              runs_scored: data_arr[20].to_i,
              stolen_bases: data_arr[21].to_i,
            )
          end
        end
      else
        return false
      end
    end
  end
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
