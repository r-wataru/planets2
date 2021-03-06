# == Schema Information
#
# Table name: pitcher_total_results
#
#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  season_id          :integer          not null
#  pitching_number    :integer          default(0), not null
#  hit                :integer          default(0), not null
#  run                :integer          default(0), not null
#  remorse_point      :integer          default(0), not null
#  strikeouts         :integer          default(0), not null
#  winning            :integer          default(0), not null
#  defeat             :integer          default(0), not null
#  hold_number        :integer          default(0), not null
#  save_number        :integer          default(0), not null
#  winning_rate       :string(255)      default(""), not null
#  struck_out_rate    :string(255)      default(""), not null
#  earned_run_average :string(255)      default(""), not null
#  set_games          :text
#  deleted_at         :datetime
#  created_at         :datetime
#  updated_at         :datetime
#
# Indexes
#
#  index_pitcher_total_results_on_user_id  (user_id)
#

class PitcherTotalResult < ActiveRecord::Base
  belongs_to :user
  belongs_to :season
  serialize :set_games

  attr_accessor :updating_total

  before_save do
    if self.updating_total == true
      self.winning_rate = Rate.winning_rate(self)
      self.struck_out_rate = Rate.struck_out_rate(self)
      self.earned_run_average = Rate.earned_run_average(self)
    end
  end

  def update_data(game)
    result = user.pitcher_results.find_by(game_id: game.id)
    if self.set_games.nil?
      self.set_games = [game.id] unless result.nil?
    else
      self.set_games << game.id unless result.nil?
    end
    unless result.nil?
      self.pitching_number += result.pitching_number
      self.hit += result.hit
      self.run += result.run
      self.remorse_point += result.remorse_point
      self.strikeouts += result.strikeouts
      self.winning += result.winning
      self.defeat += result.defeat
      self.hold_number += result.hold_number
      self.save_number += result.save_number
      self.save
    end
  end

  class << self
    def update_or_create(result)
      u = result.user
      s = result.game.season
      t = PitcherTotalResult.where(user_id: u.id, season_id: s.id).first
      if t.present?
        t.pitching_number + result.pitching_number.to_i
        t.hit + result.hit.to_i
        t.run + result.run.to_i
        t.remorse_point + result.remorse_point.to_i
        t.strikeouts + result.strikeouts.to_i
        t.winning.to_i + result.winning.to_i
        t.defeat.to_i + result.defeat.to_i
        t.hold_number.to_i + result.hold_number.to_i
        t.save_number.to_i + result.save_number.to_i
        t.set_games << result.game.id
        t.save
      else
        self.new_data(result.user,result.game.season,result.game)
      end
    end

    def new_data(user,season,game)
      array = [game.id]
      unless user.pitcher_results.find_by(game_id: game.id).nil?
        result = user.pitcher_results.find_by(game_id: game.id)
        self.create(
          user_id: user.id,
          season_id: season.id,
          pitching_number: result.pitching_number,
          hit: result.hit,
          run: result.run,
          remorse_point: result.remorse_point,
          strikeouts: result.strikeouts,
          winning: result.winning,
          defeat: result.defeat,
          hold_number: result.hold_number,
          save_number: result.save_number,
          set_games: array)
      end
    end

    def team_earned_run_average(results)
      array = []
      results.each do |result|
        array << result.earned_run_average.to_f
      end
      return (array.inject(:+) / array.count).round(3)
    end
  end
end
