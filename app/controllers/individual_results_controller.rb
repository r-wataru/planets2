class IndividualResultsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @individual_results = @game.individual_results
    @result = @game.individual_results.new
  end

  def create
    @game = Game.find(params[:game_id])
    @result = @game.individual_results.new result_params
    if @result.save
      flash.notice = "登録しました。"
      redirect_to [ :new, @game, :individual_result ]
    else
      flash.now.alert = "入力に誤りがあります。"
      render action: :new
    end
  end

  def edit
    @game = Game.find(params[:game_id])
  end

  def update
    @game = Game.find(params[:game_id])
  end

  private
  def result_params
    params.require(:individual_result).permit(
      :user_id,
      :plate_appearances,
      :at_bats,
      :single_hits,
      :double_hits,
      :triple_hits,
      :home_run,
      :base_on_balls,
      :hit_by_pitches,
      :sacrifice_bunts,
      :sacrifice_flies,
      :gaffe,
      :infield_grounder,
      :outfield_grounder,
      :infield_fly,
      :outfield_fly,
      :infield_linera,
      :out_linera,
      :strikeouts,
      :runs_batted_in,
      :runs_scored,
      :stolen_bases)
  end
end