class TripsController < ApplicationController
  def index
    @trips = Trip.paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def dashboard
    if current_user
      trips = Trip.all
      @average = trips.average_duration
      @longest = trips.longest_ride
      @shortest = trips.shortest_ride
      @most_rides_start_count = trips.most_rides_start.count
      @most_rides_start_name= trips.most_rides_start.name
      @most_rides_end_count = trips.most_rides_end.count
      @most_rides_end_name = trips.most_rides_end.name
      @most_bike_rides_id= trips.most_bike_rides.bike_id
      @most_bike_rides_count = trips.most_bike_rides.count
      @least_bike_rides_id = trips.least_bike_rides.bike_id
      @least_bike_rides_count = trips.least_bike_rides.count
      @date_with_most_trips_day = trips.date_with_most_trips.start_date
      @date_with_most_trips_count = trips.date_with_most_trips.count
      @date_with_least_trips_day = trips.date_with_least_trips.start_date
      @date_with_least_trips_count = trips.date_with_least_trips.count
      @user_subscription_breakdown_count_subsriber = trips.user_subscription_breakdown["Subscriber"]
      @user_subscription_breakdown_count_customer = trips.user_subscription_breakdown["Customer"]
      @subscriber_percentage = trips.user_subscription_breakdown["Subscriber"].to_f/Trip.all.count * 100
      @customer_percentage = trips.user_subscription_breakdown["Customer"].to_f/Trip.all.count * 100
    else
      render file: '/public/404'
    end
  end

end
