class ResultsController < ApplicationController
  def index
    @season = Season.find_by(use: true)
    regulation_number = @season.games.count * 1.4
    @results = @season.individual_total_results.
      where("#{regulation_number} < plate_appearances")
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
  end
end