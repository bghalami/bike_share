class Admin::StationsController < Admin::BaseController
before_action :set_station, only: [:destroy, :edit, :update]

  def new
    @station = Station.new
    @admin = current_user.role
  end

  def create
    station = Station.new(station_params)
    station.save
    flash[:notice] = "Successfully created #{station.name}!"
    redirect_to station_path(station)
  end

  def edit
    @admin = current_user.role
  end

  def update
    @station.update(station_params)
    flash[:notice] = "Successfully updated!"
    redirect_to station_path(@station)
  end

  def destroy
    @station.destroy
    redirect_to stations_path, notice: "Successfully deleted."
  end

  private
  def station_params
    params.require(:station).permit(:name, :dock_count, :city, :installation_date)
  end

  def set_station
    @station = Station.find_by(slug: params[:slug])
  end

end
