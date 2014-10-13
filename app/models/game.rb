# == Schema Information
#
# Table name: games
#
#  id                :integer          not null, primary key
#  season_id         :integer          not null
#  name              :string(255)      not null
#  description       :text
#  played_at         :datetime         not null
#  total_result      :string(255)      not null
#  winning           :integer          not null
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
#  gaffe             :integer          default(0), not null
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
#  get_strikeouts    :integer          default(0), not null
#  deleted_at        :datetime
#  created_at        :datetime
#  updated_at        :datetime
#
# Indexes
#
#  index_games_on_season_id  (season_id)
#

require 'csv'
require "kconv"
require 'nkf'
class Game < ActiveRecord::Base
  belongs_to :season
  has_many :individual_results
  has_many :pitcher_results

  scope :active, ->{ where(deleted_at: nil) }

  store :result1, accessors: [ :top, :one, :two, :three, :four, :five, :six, :seven, :eight, :nine, :total ]
  store :result2, accessors: [ :bottom, :one_2, :two_2, :three_2, :four_2, :five_2, :six_2, :seven_2, :eight_2, :nine_2, :total_2 ]

  def display_winning
    display = ""
    if self.winning == 0
      display = "勝ち"
    elsif self.winning == 1
      display = "負け"
    else
      display = "引き分け"
    end
    return display
  end

  class << self
    def import_csv
      path = Rails.root.join("db", "seeds", "data", "mla_export_p_game.csv")
      if File.exists?(path)
        file = path.read
        data = NKF::nkf('-w', file)
        csv = CSV.new(data)
        csv.each_with_index do |arr, idx|
          data_arr = arr[0].split(";")
          if data_arr[1].present? && Season.exists?(year: data_arr[32])
            date = data_arr[1].unpack("a4a2a2")
            date = Date.new(date[0].to_i, date[1].to_i,date[2].to_i)
            season = Season.find_by_year(data_arr[32])
            season.games.create(
              name: data_arr[2],
              description: data_arr[5],
              played_at: date,
              total_result: data_arr[4],
              winning: data_arr[3],
              plate_appearances: data_arr[6],
              at_bats: data_arr[7],
              single: data_arr[8],
              double: data_arr[9],
              triple: data_arr[10],
              home_run: data_arr[11],
              base_on_balls: data_arr[12],
              hit_by_pitches: data_arr[13],
              sacrifice_bunts: data_arr[14],
              sacrifice_flies: data_arr[15],
              gaffe: data_arr[16],
              infield_grounder: data_arr[17],
              outfield_grounder: data_arr[18],
              infield_fly: data_arr[19],
              outfield_fly: data_arr[20],
              infield_linera: data_arr[21],
              out_linera: data_arr[22],
              strikeouts: data_arr[23],
              runs_batted_in: data_arr[24],
              runs_scored: data_arr[25],
              stolen_bases: data_arr[26],
              pitching_number: data_arr[27],
              hit: data_arr[28],
              run: data_arr[29],
              get_strikeouts: data_arr[30])
          end
        end
      else
        return false
      end
    end
  end
end
