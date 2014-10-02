Season.all.each do |season|
  puts season.year
  season.games.each do |game|
    User.all.each do |user|
      if user.individual_total_results.present? && user.individual_total_results.exists?(season_id: season.id)
        total = user.individual_total_results.find_by_season_id(season.id)
        if total.set_games.include?(game.id)
          return false
        else
          total.update_data(game)
        end
      else
        IndividualTotalResult.new_data(user,season,game)
      end
    end
  end
end