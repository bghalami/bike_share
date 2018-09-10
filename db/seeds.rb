require 'csv'
require './app/models/trip.rb'
require './app/models/station.rb'
require './app/models/condition.rb'
require 'date'
# require './app/models/status.rb'

class Seed
  OPTIONS = {headers: true, header_converters: :symbol}

  def self.start
    clear_existing_data
    seed_stations
    # seed_statuses
    seed_trips
    seed_weather
  end

  def self.clear_existing_data
    Station.destroy_all
    # Status.destroy_all
    Trip.destroy_all
    Condition.destroy_all
  end

  def self.seed_stations
    stations = read_stations
    stations.each do |station|
      station_hash = {name: station[:name],
                      dock_count: station[:dock_count],
                      city: station[:city],
                      installation_date: station[:installation_date]}
      station = Station.create!(station_hash)
      puts "Created #{station.name}"
    end
    puts "Created all stations."
  end

  def self.read_stations
    @stations = []
    CSV.foreach(Rails.root.join('db','csv','station.csv'), OPTIONS) do |station|
      @stations << station
    end
    @stations
  end

  def self.seed_trips
    trips = read_trips.sample(500)
    trips.each do |trip|
      trip_hash = { duration: trip[:duration],
                    start_date: Date.strptime(trip[:start_date], '%m/%d/%y'),
                    start_station_id: trip[:start_station_id],
                    end_date: Date.strptime(trip[:end_date], '%m/%d/%y'),
                    end_station_id: trip[:end_station_id],
                    zip_code: trip[:zip_code],
                    bike_id: trip[:bike_id],
                    subscription_type: trip[:subscription_type]}
      if Station.find_by_id(trip[:start_station_id]) && Station.find_by_id(trip[:end_station_id]) && trip[:zip_code]
        trip = Trip.create!(trip_hash)
        puts "Created trip!"
      else
        puts "Skipped trip!"
      end
    end
    puts "Created all trips."
  end

  def self.read_trips
    @trips = []
    CSV.foreach(Rails.root.join('db','csv','trip.csv'), OPTIONS) do |trip|
      @trips << trip
    end
    @trips
  end

  def self.seed_weather
    weathers = read_weather.sample(500)
    weathers.each do |weather|
      weather_hash = {date: Date.strptime(weather[:date], '%m/%d/%y'),
                    max_temp: weather[:max_temp].to_f,
                    mean_temp: weather[:mean_temp].to_f,
                    min_temp: weather[:min_temp].to_f,
                    mean_humidity: weather[:mean_humidity].to_f,
                    mean_visibility: weather[:mean_visibility].to_f,
                    mean_wind_speed: weather[:mean_wind_speed].to_f,
                    precip: weather[:precip].to_f
                  }
      if
        weather = Condition.create!(weather_hash)
        puts "Created condition"
      else
        puts "Skipped condition!"
      end
    end
    puts "Created all weather."
  end

  def self.read_weather
    @weathers = []
    CSV.foreach(Rails.root.join('db','csv','weather.csv'), OPTIONS) do |weather|
      @weathers << weather
    end
    @weathers
  end

end

Seed.start
