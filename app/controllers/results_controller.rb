class ResultsController < ApplicationController
  def index
    @season = Season.find_by(use: true)
    regulation_number = @season.games.count * 1.4
    regulation_pitcher_number = @season.games.count * 1
    @results = @season.individual_total_results.
      where("#{regulation_number} < plate_appearances")
    @pitcher_results = @season.pitcher_total_results.
      where("#{regulation_pitcher_number} < pitching_number")
    # 野手成績
    if params[:change].present?
      if params[:change] == "game_count"
        @results = @results.sort{|a, b| b.set_games.count <=> a.set_games.count }
      elsif params[:change] == "hits"
        @results = @results.order("(single_hits + double_hits + triple_hits + home_run) DESC")
      elsif params[:change] == "total_bases"
        @results = @results.order("(single_hits + double_hits * 2 + triple_hits * 3 + home_run * 4) DESC")
      else
        @results = @results.order("#{params[:change]} DESC")
      end
    else
      @results = @results.order("batting_average DESC")
    end

    # 投手成績
    if params[:p_change].present?
      if params[:p_change] == "game_count"
        @pitcher_results = @pitcher_results.sort{|a, b| b.set_games.count <=> a.set_games.count }
      else
        @pitcher_results = @pitcher_results.order("#{params[:p_change]} DESC")
      end
    end
  end
end