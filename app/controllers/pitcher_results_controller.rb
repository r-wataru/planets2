class PitcherResultsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @pitcher_results = @game.pitcher_results
    @result = @game.pitcher_results.new
  end

  def create
    @game = Game.find(params[:game_id])
    @result = @game.pitcher_results.new pitcher_params
    if @result.save
      flash.notice = "完了しました。"
      if params[:next_action].present?
        redirect_to [ :new, @game, :individual_result ]
      else
        redirect_to [ :new, @game, :pitcher_result ]
      end
    else
      flash.now.alert = "入力に誤りがあります。"
      render action: :new
    end
  end

  private
  def pitcher_params
    params.require(:pitcher_result).permit(
      :user_id,
      :pitching_number,
      :hit,
      :run,
      :remorse_point,
      :strikeouts,
      :winning,
      :defeat,
      :hold_number,
      :save_number)
  end
end