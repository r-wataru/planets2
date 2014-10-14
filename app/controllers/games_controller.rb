class GamesController < ApplicationController
  def new
    season = Season.find_by(use: true)
    @game = Game.new(winning: 0, season_id: season.id)
  end

  def create
    @game = Game.new game_params
    @game.creating_game = true
    if @game.save
      flash.notice = "登録しました。"
      redirect_to [ :new, @game, :pitcher_result ]
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

  def destroy
    @game = Game.find(params[:game_id])
  end

  private
  def game_params
    params.require(:game).permit(
      :season_id,
      :name,
      :played_at,
      :total_result,
      :description,
      :winning,
      :top,
      :one,
      :two,
      :three,
      :four,
      :five,
      :six,
      :seven,
      :eight,
      :nine,
      :total,
      :bottom,
      :one_2,
      :two_2,
      :three_2,
      :four_2,
      :five_2,
      :six_2,
      :seven_2,
      :eight_2,
      :nine_2,
      :total_2)
  end
end