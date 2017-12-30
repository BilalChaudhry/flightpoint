require 'csv'    

namespace :import do
    desc "import airline database"
    task :airlines => :environment do
      csv_text = File.read(Rails.root.join('data/airlines.dat'))
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        Airline.create!(row.to_hash)
      end
    end
  
    desc "import airports database"
    task :airports => :environment do
      csv_text = File.read(Rails.root.join('data/airports-extended.dat'))
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        append_row = row.to_hash        
        append_row[:location] = {latitude: append_row["latitude"].to_f, longitude: append_row["longitude"].to_f}
        Airport.create!(append_row)
      end
    end

    desc "import route database for airlines"
    task :routes => :environment do
      csv_text = File.read(Rails.root.join('data/routes.dat'))
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        Route.create!(row.to_hash)
      end
    end

    desc "import zipcode database"
    task :zipcode => :environment do
      csv_text = File.read(Rails.root.join('data/free-zipcode-database.csv'))
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        append_row = row.to_hash
        append_row[:location] = {latitude: append_row["latitude"].to_f, longitude: append_row["longitude"].to_f}
        Zipcode.create!(append_row)
      end
    end

    task :rebuild => :environment do
      puts "Building Airlines..."
      Airline.delete_all
      Rake::Task['import:airlines'].invoke
      puts "Building Airports and Terminals..."
      Airport.delete_all
      Rake::Task['import:airports'].invoke
      puts "Building Routes..."
      Route.delete_all
      Rake::Task['import:routes'].invoke
      puts "Building Zipcodes..."
      Zipcode.delete_all
      Rake::Task['import:zipcode'].invoke
      puts "Building Geospatial Indexes..."
      Rake::Task['db:mongoid:create_indexes'].invoke
    end
  end