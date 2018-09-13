class Trip < ApplicationRecord
  validates_presence_of :duration,
                        :start_date,
                        :end_date,
                        :bike_id,
                        :subscription_type,
                        :zip_code,
                        :start_station_id,
                        :end_station_id

    belongs_to :start_station, class_name: "Station"
    belongs_to :end_station, class_name: "Station"

  def self.average_duration
    average(:duration).round(2)
  end

  def self.longest_ride
    maximum(:duration).round(2)
  end

  def self.shortest_ride
    minimum(:duration).round(2)
  end

  def self.most_rides_start
    Station.select("name, count(trips.start_station_id) as count").joins("JOIN trips ON stations.id = trips.start_station_id").group(:name).order("count(trips.start_station_id) desc").limit(1).first#returns 32
  end

  def self.most_rides_end
    Station.select("name, count(trips.end_station_id) as count")
      .joins("JOIN trips ON stations.id = trips.end_station_id")
      .group(:name)
      .order("count(trips.end_station_id) desc")
      .limit(1)
      .first
  end

  # def monthly_breakdown
  #   SELECT date_trunc('month', start_date),count(start_date) FROM trips GROUP BY  date_trunc('month', start_date);
  # end
  # def yearly_breakdown
  #   SELECT date_trunc('year', start_date),count(start_date) FROM trips GROUP BY  date_trunc('year', start_date);
  # end

  def self.user_subscription_breakdown
     Trip.select("subscription_type, count(subscription_type)").group("subscription_type").count("subscription_type")
  end

  def self.most_bike_rides
    select("bike_id, count(bike_id) as count").group(:bike_id).order("count(bike_id) desc").limit(1).first
  end

  def self.least_bike_rides
    select("bike_id, count(bike_id) as count").group(:bike_id).order("count(bike_id) asc").limit(1).first
  end

  def self.date_with_most_trips
    select("start_date, count(start_date) as count").group(:start_date).order("count(start_date) desc").limit(1).first
  end

  def self.date_with_least_trips
    select("start_date, count(start_date) as count").group(:start_date).order("count(start_date) asc").limit(1).first
  end
    def self.max_temp_data(first_dig)
      {high: max_temp_high(first_dig), low: max_temp_low(first_dig), avg: max_temp_avg(first_dig)}
    end

    def self.precip_data(first_num, second_num)
      {high: precip_high(first_num, second_num), low: precip_low(first_num, second_num), avg: precip_avg(first_num, second_num)}
    end

    def self.wind_data(first_num, second_num)
      {high: mean_wind_speed_high(first_num, second_num), low: mean_wind_speed_low(first_num, second_num), avg: mean_wind_speed_avg(first_num, second_num)}
    end

    def self.vis_data(first_num, second_num)
      {high: mean_visibility_high(first_num, second_num), low: mean_visibility_low(first_num, second_num), avg: mean_visibility_avg(first_num, second_num)}
    end



    def self.max_temp_high(first_dig)
      Trip.select(
        "start_date, count(trips.id) as count").joins(
          "JOIN conditions ON conditions.date = trips.start_date").where(
            "max_temp BETWEEN #{first_dig}0.0 AND #{first_dig}9.9").group(
              :start_date).order(
                "count(trips.id) desc").limit(1).count(
                  "trips.id").to_a.flatten[1].to_f
    end

    def self.max_temp_low(first_dig)
      Trip.select(
        "start_date, count(trips.id) as count").joins(
          "JOIN conditions ON conditions.date = trips.start_date").where(
            "max_temp BETWEEN #{first_dig}0.0 AND #{first_dig}9.9").group(
              :start_date).order(
                "count(trips.id) asc").limit(1).count(
                  "trips.id").to_a.flatten[1].to_f
    end

    def self.max_temp_avg(first_dig)
      all_count = Trip.select(
        "start_date, count(trips.id) as count").joins(
          "JOIN conditions ON conditions.date = trips.start_date").where(
            "max_temp BETWEEN #{first_dig}0.0 AND #{first_dig}9.9").group(
              :start_date).order(
                "count(trips.id)").count('trips.id')

      trip_total = 0
      if all_count.size > 0
        all_count.each do |date, _count|
          trip_total += all_count[date]
        end
        (trip_total.to_f / all_count.size.to_f).round(2)
      else
        trip_total.to_f.round(2)
      end
    end

    def self.precip_high(first_f, second_f)
      Trip.select(
        "start_date, count(trips.id) as count").joins(
          "JOIN conditions ON conditions.date = trips.start_date").where(
            "precip BETWEEN #{first_f} AND #{second_f}").group(
              :start_date).order(
                "count(trips.id) desc").limit(1).count(
                  "trips.id").to_a.flatten[1].to_f
    end

    def self.precip_low(first_f, second_f)
      Trip.select(
        "start_date, count(trips.id) as count").joins(
          "JOIN conditions ON conditions.date = trips.start_date").where(
            "precip BETWEEN #{first_f} AND #{second_f}").group(
              :start_date).order(
                "count(trips.id) asc").limit(1).count(
                  "trips.id").to_a.flatten[1].to_f
    end

    def self.precip_avg(first_f, second_f)
      all_count = Trip.select(
        "start_date, count(trips.id) as count").joins(
          "JOIN conditions ON conditions.date = trips.start_date").where(
            "precip BETWEEN #{first_f} AND #{second_f}").group(
              :start_date).order(
                "count(trips.id)").count('trips.id')

      trip_total = 0
      if all_count.size > 0
        all_count.each do |date, _count|
          trip_total += all_count[date]
        end
        (trip_total.to_f / all_count.size.to_f).round(2)
      else
        trip_total.to_f.round(2)
      end
    end
    def self.mean_wind_speed_high(first_f, second_f)
      Trip.select(
        "start_date, count(trips.id) as count").joins(
          "JOIN conditions ON conditions.date = trips.start_date").where(
            "mean_wind_speed BETWEEN #{first_f} AND #{second_f}").group(
              :start_date).order(
                "count(trips.id) desc").limit(1).count(
                  "trips.id").to_a.flatten[1].to_f
    end

    def self.mean_wind_speed_low(first_f, second_f)
      Trip.select(
        "start_date, count(trips.id) as count").joins(
          "JOIN conditions ON conditions.date = trips.start_date").where(
            "mean_wind_speed BETWEEN #{first_f} AND #{second_f}").group(
              :start_date).order(
                "count(trips.id) asc").limit(1).count(
                  "trips.id").to_a.flatten[1].to_f
    end

    def self.mean_wind_speed_avg(first_f, second_f)
      all_count = Trip.select(
        "start_date, count(trips.id) as count").joins(
          "JOIN conditions ON conditions.date = trips.start_date").where(
            "mean_wind_speed BETWEEN #{first_f} AND #{second_f}").group(
              :start_date).order(
                "count(trips.id)").count('trips.id')

      trip_total = 0
      if all_count.size > 0
        all_count.each do |date, _count|
          trip_total += all_count[date]
        end
        (trip_total.to_f / all_count.size.to_f).round(2)
      else
        trip_total.to_f.round(2)
      end
    end

    def self.mean_visibility_high(first_f, second_f)
      Trip.select(
        "start_date, count(trips.id) as count").joins(
          "JOIN conditions ON conditions.date = trips.start_date").where(
            "mean_visibility BETWEEN #{first_f} AND #{second_f}").group(
              :start_date).order(
                "count(trips.id) desc").limit(1).count(
                  "trips.id").to_a.flatten[1].to_f
    end

    def self.mean_visibility_low(first_f, second_f)
      Trip.select(
        "start_date, count(trips.id) as count").joins(
          "JOIN conditions ON conditions.date = trips.start_date").where(
            "mean_visibility BETWEEN #{first_f} AND #{second_f}").group(
              :start_date).order(
                "count(trips.id) asc").limit(1).count(
                  "trips.id").to_a.flatten[1].to_f
    end

    def self.mean_visibility_avg(first_f, second_f)
      all_count = Trip.select(
        "start_date, count(trips.id) as count").joins(
          "JOIN conditions ON conditions.date = trips.start_date").where(
            "mean_visibility BETWEEN #{first_f} AND #{second_f}").group(
              :start_date).order(
                "count(trips.id)").count('trips.id')

      trip_total = 0
      if all_count.size > 0
        all_count.each do |date, _count|
          trip_total += all_count[date]
        end
        (trip_total.to_f / all_count.size.to_f).round(2)
      else
        trip_total.to_f.round(2)
      end
    end

end
