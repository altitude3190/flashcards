require 'csv'

# rake import:words
namespace :import do
  desc "Import useers from csv"

  task words: :environment do
    path = File.join Rails.root, "db/data/words.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          language_id: row["language_id"],
          category_id: row["category_id"],
          word: row["word"],
          meaning: row["meaning"],
          ruby: row["ruby"],
          pos: row["pos"],
      }
    end
    puts "start to create words data"
    begin
      Word.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end
end
