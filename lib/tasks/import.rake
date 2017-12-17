require 'csv'    

namespace :import do
    desc "TODO"
    task :airlines => :environment do
      csv_text = File.read(Rails.root.join('data/airlines.dat'))
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        Airline.create!(row.to_hash)
      end
    end
  
    desc "TODO"
    task :airports => :environment do
      csv_text = File.read(Rails.root.join('data/airports-extended.dat'))
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        Airport.create!(row.to_hash)
      end
    end

    desc "TODO"
    task :routes => :environment do
      csv_text = File.read(Rails.root.join('data/routes.dat'))
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        Route.create!(row.to_hash)
      end
    end

    task :rebuild => :environment do
      Airline.delete_all
      Rake::Task['import:airlines'].invoke
      Airport.delete_all
      Rake::Task['import:airports'].invoke
      Route.delete_all
      Rake::Task['import:routes'].invoke
    end
  end