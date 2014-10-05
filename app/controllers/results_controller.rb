class ResultsController < ApplicationController
  def index
    @season = Season.find_by(use: true)
    regulation_number = @season.games.count * 1.4
    @results = @season.individual_total_results.
      where("#{regulation_number} < plate_appearances")
    if params[:change].present?
      @results = @results.order("#{params[:change]} DESC")
    else
      @results = @results.order("batting_average DESC")
    end
  end
end