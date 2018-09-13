require 'rails_helper'

describe 'as a visitor' do
  describe 'when visiting /condition/2 show page' do
    before(:each) do
      user = User.create!(name: "Finn", email: "pip@pip.com", password: "123")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end
    it 'shows unique conditions for show page' do

      station_1 = Station.create(name:"1 station",dock_count: 3, city: "Denver", installation_date: Date.strptime("03/23/2016", '%m/%d/%Y'))
      station_2 = Station.create(name:"2 station",dock_count: 3, city: "Denver", installation_date: Date.strptime("03/23/2016", '%m/%d/%Y'))

      trip_1 = Trip.create(duration: 100, start_date: "09/01/2018", start_station:station_1, end_date: "09/01/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_3 = Trip.create(duration: 100, start_date: "09/02/2018", start_station:station_1, end_date: "09/02/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_4 = Trip.create(duration: 100, start_date: "09/02/2018", start_station:station_1, end_date: "09/02/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_5 = Trip.create(duration: 100, start_date: "09/03/2018", start_station:station_1, end_date: "09/03/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_6 = Trip.create(duration: 100, start_date: "09/03/2018", start_station:station_1, end_date: "09/03/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_7 = Trip.create(duration: 100, start_date: "09/04/2018", start_station:station_1, end_date: "09/04/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_8 = Trip.create(duration: 100, start_date: "09/04/2018", start_station:station_1, end_date: "09/04/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_9 = Trip.create(duration: 100, start_date: "09/04/2018", start_station:station_1, end_date: "09/04/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_1 = Trip.create(duration: 100, start_date: "09/05/2018", start_station:station_1, end_date: "09/05/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_12 = Trip.create(duration: 100, start_date: "09/06/2018", start_station:station_1, end_date: "09/06/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_13 = Trip.create(duration: 100, start_date: "09/06/2018", start_station:station_1, end_date: "09/06/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )

      condition_1 = Condition.create(date:"09/01/2018", max_temp:80.0, mean_temp:75.0, min_temp:40.0, mean_humidity:12.5, mean_visibility:10.0, mean_wind_speed:10.0, precip:1.1)
      condition_2 = Condition.create(date:"09/02/2018", max_temp:81.0, mean_temp:76.0, min_temp:41.0, mean_humidity:13.0, mean_visibility:12.0, mean_wind_speed:5.0, precip:0.0)
      condition_2 = Condition.create(date:"09/03/2018", max_temp:90.0, mean_temp:75.0, min_temp:42.0, mean_humidity:27.0, mean_visibility:10.0, mean_wind_speed:16.0, precip:3.4)
      condition_2 = Condition.create(date:"09/04/2018", max_temp:87.0, mean_temp:78.0, min_temp:43.0, mean_humidity:14.0, mean_visibility:19.0, mean_wind_speed:0.0, precip:2.3)
      condition_2 = Condition.create(date:"09/05/2018", max_temp:93.0, mean_temp:72.0, min_temp:40.0, mean_humidity:30.0, mean_visibility:1.0, mean_wind_speed:0.0, precip:1.1)
      condition_2 = Condition.create(date:"09/06/2018", max_temp:82.0, mean_temp:73.0, min_temp:42.0, mean_humidity:18.0, mean_visibility:19.0, mean_wind_speed:12.0, precip:0.7)

      visit condition_dashboard_path

      within(".max-temp-table") do
        expect(page).to have_content("Avg. # of Rides")
        expect(page).to have_content("Highest # of Rides")
        expect(page).to have_content("Lowest # of Rides")
        expect(page).to have_content("40.0 - 49.9")
        expect(page).to have_content("50.0 - 59.9")
        expect(page).to have_content("60.0 - 69.9")
        expect(page).to have_content("70.0 - 79.9")
        expect(page).to have_content("80.0 - 89.9")
        expect(page).to have_content("2.0")
        expect(page).to have_content("3.0")
        expect(page).to have_content("1.0")
        expect(page).to have_content("90.0 - 99.9")
        expect(page).to have_content("1.5")
        expect(page).to have_content("2.0")
        expect(page).to have_content("1.0")
      end
      within(".precip-table") do
        expect(page).to have_content("Avg. # of Rides")
        expect(page).to have_content("Highest # of Rides")
        expect(page).to have_content("Lowest # of Rides")
        expect(page).to have_content("0.0 - 0.5")
        expect(page).to have_content("2.0")
        expect(page).to have_content("0.5 - 1.0")
        expect(page).to have_content("2.0")
        expect(page).to have_content("1.0 - 1.5")
        expect(page).to have_content("2.0")
        expect(page).to have_content("1.5 - 2.0")
        expect(page).to have_content("2.0 - 2.5")
        expect(page).to have_content("3.0")
        expect(page).to have_content("2.5 - 3.0")
        expect(page).to have_content("3.0 - 3.5")
        expect(page).to have_content("2.0")
      end
      within(".mean-wind-table") do
        expect(page).to have_content("Avg. # of Rides")
        expect(page).to have_content("Highest # of Rides")
        expect(page).to have_content("Lowest # of Rides")
        expect(page).to have_content("0.0 - 3.0")
        expect(page).to have_content("3.0")
        expect(page).to have_content("1.0")
        expect(page).to have_content("2.0")
        expect(page).to have_content("4.0 - 7.0")
        expect(page).to have_content("2.0")
        expect(page).to have_content("8.0 - 11.0")
        expect(page).to have_content("1.0")
        expect(page).to have_content("12.0 - 15.0")
        expect(page).to have_content("2.0")
        expect(page).to have_content("16.0 - 19.0")
        expect(page).to have_content("2.0")
      end
      within(".mean-vis-table") do
        expect(page).to have_content("Avg. # of Rides")
        expect(page).to have_content("Highest # of Rides")
        expect(page).to have_content("Lowest # of Rides")
        expect(page).to have_content("0.0 - 3.0")
        expect(page).to have_content("1.0")
        expect(page).to have_content("4.0 - 7.0")
        expect(page).to have_content("8.0 - 11.0")
        expect(page).to have_content("2.0")
        expect(page).to have_content("1.0")
        expect(page).to have_content("2.5")
        expect(page).to have_content("12.0 - 15.0")
        expect(page).to have_content("2.0")
        expect(page).to have_content("16.0 - 19.0")
        expect(page).to have_content("3.0")
        expect(page).to have_content("2.0")
        expect(page).to have_content("2.5")
      end
    end
  end
end
