# == Schema Information
#
# Table name: individual_total_results
#
#  id                  :integer          not null, primary key
#  user_id             :integer          not null
#  season_id           :integer          not null
#  plate_appearances   :integer          default(0), not null
#  at_bats             :integer          default(0), not null
#  single_hits         :integer          default(0), not null
#  double_hits         :integer          default(0), not null
#  triple_hits         :integer          default(0), not null
#  home_run            :integer          default(0), not null
#  base_on_balls       :integer          default(0), not null
#  hit_by_pitches      :integer          default(0), not null
#  sacrifice_bunts     :integer          default(0), not null
#  sacrifice_flies     :integer          default(0), not null
#  gaffe               :integer          default(0), not null
#  infield_grounder    :integer          default(0), not null
#  outfield_grounder   :integer          default(0), not null
#  infield_fly         :integer          default(0), not null
#  outfield_fly        :integer          default(0), not null
#  infield_linera      :integer          default(0), not null
#  out_linera          :integer          default(0), not null
#  strikeouts          :integer          default(0), not null
#  runs_batted_in      :integer          default(0), not null
#  runs_scored         :integer          default(0), not null
#  stolen_bases        :integer          default(0), not null
#  set_games           :text
#  batting_average     :string(255)      default(""), not null
#  base_percentage     :string(255)      default(""), not null
#  slugging_percentage :string(255)      default(""), not null
#  deleted_at          :datetime
#  created_at          :datetime
#  updated_at          :datetime
#
# Indexes
#
#  index_individual_total_results_on_user_id  (user_id)
#

class IndividualTotalResult < ActiveRecord::Base
  belongs_to :user
  belongs_to :season
  serialize :set_games

  def total_hits
    self.single_hits.to_i + self.double_hits.to_i + self.triple_hits.to_i + self.home_run.to_i
  end

  def total_bases
    self.single_hits.to_i + self.double_hits.to_i * 2 + self.triple_hits.to_i * 3 + self.home_run.to_i * 4
  end

  def update_data(game)
    result = user.individual_results.find_by(game_id: game.id)
    if self.set_games.nil?
      self.set_games = [game.id] unless result.nil?
    else
      self.set_games << game.id unless result.nil?
    end
    unless result.nil?
      self.plate_appearances += result.plate_appearances
      self.at_bats += result.at_bats
      self.single_hits += result.single_hits
      self.double_hits += result.double_hits
      self.triple_hits += result.triple_hits
      self.home_run += result.home_run
      self.base_on_balls += result.base_on_balls
      self.hit_by_pitches += result.hit_by_pitches
      self.sacrifice_bunts += result.sacrifice_bunts
      self.sacrifice_flies += result.sacrifice_flies
      self.gaffe += result.gaffe
      self.infield_grounder += result.infield_grounder
      self.outfield_grounder += result.outfield_grounder
      self.infield_fly += result.infield_fly
      self.outfield_fly += result.outfield_fly
      self.infield_linera += result.infield_linera
      self.out_linera += result.out_linera
      self.strikeouts += result.strikeouts
      self.runs_batted_in += result.runs_batted_in
      self.runs_scored += result.runs_scored
      self.stolen_bases += result.stolen_bases
      self.save
    end
  end

  class << self
    def new_data(user,season, game)
      array = [game.id]
      unless user.individual_results.find_by(game_id: game.id).nil?
        result = user.individual_results.find_by(game_id: game.id)
        self.create(
          user_id: user.id,
          season_id: season.id,
          plate_appearances: result.plate_appearances,
          at_bats: result.at_bats,
          single_hits: result.single_hits,
          double_hits: result.double_hits,
          triple_hits: result.triple_hits,
          home_run: result.home_run,
          base_on_balls: result.base_on_balls,
          hit_by_pitches: result.hit_by_pitches,
          sacrifice_bunts: result.sacrifice_bunts,
          sacrifice_flies: result.sacrifice_flies,
          gaffe: result.gaffe,
          infield_grounder: result.infield_grounder,
          outfield_grounder: result.outfield_grounder,
          infield_fly: result.infield_fly,
          outfield_fly: result.outfield_fly,
          infield_linera: result.infield_linera,
          out_linera: result.out_linera,
          strikeouts: result.strikeouts,
          runs_batted_in: result.runs_batted_in,
          runs_scored: result.runs_scored,
          stolen_bases: result.stolen_bases,
          set_games: array)
      end
    end

    def team_batting_average(results)
      array = []
      results.each do |result|
        array << result.batting_average.to_f
      end
      return (array.inject(:+) / array.count).round(3)
    end
  end
end
