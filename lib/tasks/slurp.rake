namespace :slurp do
  desc "TODO"
  task breweries: :environment do
    require "csv"
    csv_text = File.read(Rails.root.join("lib", "csvs", "breweries.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

  end

end
