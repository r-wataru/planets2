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