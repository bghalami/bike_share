require "rails_helper"

describe 'User visits a station show page' do
  context 'User is a visitor' do
    it 'should show station attributes' do
      station = Station.create( name:              "San Jose Diridon Caltrain Station",
                                dock_count:        27,
                                city:              "San Jose",
                                installation_date: Date.strptime("8/6/2013", "%m/%d/%Y")
                              )

      visit station_path(station)

      expect(current_path).to eq("/san-jose-diridon-caltrain-station")
      expect(page).to have_content(station.name)
      expect(page).to have_content(station.dock_count)
      expect(page).to have_content(station.city)
      expect(page).to have_content(station.installation_date)
    end
  end
  context 'user is a registered user' do
    before(:each) do
      station = Station.create( name:              "San Jose Diridon Caltrain Station",
                                dock_count:        27,
                                city:              "San Jose",
                                installation_date: Date.strptime("8/6/2013", "%m/%d/%Y")
                              )
      station = Station.create( name:              "San Maria",
                                dock_count:        18,
                                city:              "San Jose",
                                installation_date: Date.strptime("8/6/2013", "%m/%d/%Y")
                              )
      station = Station.create( name:              "San Martin",
                                dock_count:        11,
                                city:              "San Jose",
                                installation_date: Date.strptime("8/6/2013", "%m/%d/%Y")
                              )

    end
    it 'shows number of rides started at the station, rides ended at the station, most frequent destination station (for rides beginning at station)' do

      visit stations_dashboard_path



    end
    it 'shows Most frequent origination station (for rides that ended at this station, Date with the highest number of trips started at this station)' do
      visit stations_dashboard_path

    end
    it 'shows Most frequent zip code for users starting trips at this station, Bike ID most frequently starting a trip at this station' do
      visit stations_dashboard_path

    end
  end
end
