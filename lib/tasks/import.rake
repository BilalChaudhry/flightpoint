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
        Airport.create!(row.to_hash)
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
        Zipcode.create!(row.to_hash)
      end
    end

    task :rebuild => :environment do
      Airline.delete_all
      Rake::Task['import:airlines'].invoke
      Airport.delete_all
      Rake::Task['import:airports'].invoke
      Route.delete_all
      Rake::Task['import:routes'].invoke
      Zipcode.delete_all
      Rake::Task['import:zipcode'].invoke
    end
  end