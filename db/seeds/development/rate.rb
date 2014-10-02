# バッター成績
User.all.each do |user|
  Season.all.each do |season|
    if user.individual_total_results.exists?(season_id: season.id)
      total = user.individual_total_results.find_by(season_id: season.id)
      total.batting_average = Rate.batting_average(total).to_s
      total.base_percentage = Rate.base_percentage(total).to_s
      total.slugging_percentage = Rate.slugging_percentage(total).to_s
      total.save
    end
  end
end

# ピッチャー成績
user_ids = PitcherResult.all.map(&:user_id)
User.where(id: user_ids).each do |user|
  Season.all.each do |season|
    if user.pitcher_total_results.exists?(season_id: season.id)
      total = user.pitcher_total_results.find_by(season_id: season.id)
      total.winning_rate = Rate.winning_rate(total).to_s
      total.struck_out_rate = Rate.struck_out_rate(total).to_s
      total.earned_run_average = Rate.earned_run_average(total).to_s
      total.save
    end
  end
end