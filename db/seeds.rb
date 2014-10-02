unless Rails.env.production? || Rails.env.staging?
  require 'database_cleaner'
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean
end

table_names = %w(users administrators import_data import_total_data rate)

table_names.each do |table_name|
  dir = case Rails.env
  when 'development'
    'development'
  when 'staging'
    'development' # 開発環境と同じにする
  when 'production'
    'production'
  else
    break
  end
  path = Rails.root.join('db', 'seeds', dir, "#{table_name}.rb")
  if File.exist?(path)
    puts "Creating #{table_name}...."
    require(path)
  end
end
