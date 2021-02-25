namespace :slurp do
  desc "TODO"
  task breweries: :environment do
    require "csv"
    csv_text = File.read(Rails.root.join("lib", "csvs", "breweries.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

    csv.each do |row|
      b = Brewery.new
      b.name = row["name"]
      b.location = row["location"]
      b.phone_number = row["phone_number"]
      b.website = row["website"]
      b.logo_image = row["logo_image"]
      b.banner_image = row["banner_image"]
      b.description = row["description"]
      b.save

      puts "#{b.name} has been saved"

    end

  end

  task beers: :environment do
    require "csv"
    csv_text = File.read(Rails.root.join("lib", "csvs", "beers.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

    csv.each do |row|
      b = Beer.new
      b.name = row["name"]
      b.brewery_id = row["brewery_id"]
      b.abv = row["abv"]
      b.ibu = row["ibu"]
      b.image = row["image"]
      b.description = row["description"]
      b.save

      puts "#{b.name} has been saved"

    end

  end


end
