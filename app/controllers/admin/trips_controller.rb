class Admin::TripsController < Admin::BaseController

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    flash[:notice] = "Successfully deleted."
    redirect_to trips_path
  end

  def edit
    @trip = Trip.find(params[:id])
    @station = Station.find_by(params[@trip[:start_station_id]])
  end
end
