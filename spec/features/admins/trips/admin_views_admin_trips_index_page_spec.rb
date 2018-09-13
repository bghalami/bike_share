require 'rails_helper'

feature 'Admin views admin trips index page functions' do
  context 'Admin views edit and delete buttons for each trip' do
    context 'as an admin on the trips index page' do

        let!(:station_1){Station.create(name:"1 station",dock_count: 3, city: "Denver", installation_date: Date.strptime("03/23/2016", '%m/%d/%Y'))}
        let!(:station_2){Station.create(name:"2 station",dock_count: 3, city: "Denver", installation_date: Date.strptime("03/23/2016", '%m/%d/%Y'))}

        let!(:trip_1) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_2) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_3) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_4) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_5) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_6) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_7) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_8) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_9) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_10) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_11) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_12) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_13) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_14) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_15) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_16) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_17) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_18) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_19) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_20) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_21) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_22) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_23) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_24) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_25) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_26) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_27) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_28) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_29) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
        let!(:trip_30) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Last on page 1", zip_code: 94127 )}
        let!(:trip_31) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Not on page 1", zip_code: 94127 )}
        let!(:trip_32) {Trip.create!(duration: 7, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Also not on page 1", zip_code: 94127 )}

      before do
        admin = User.create!(name: "Dr.Who", email: "thedoctor@tardis.com", password: "blue", password_confirmation: "blue", role: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit trips_path
      end

        scenario 'I am on the admin trips index page' do
          expect(current_path).to eq(trips_path)
          expect(page).to have_content("Admin Trips")
        end

        scenario 'I view an edit button for each trip' do
          expect(page).to have_link("Edit")
        end

        scenario 'I view a delete button for each trip' do
          expect(page).to have_link("Delete")
        end

        scenario 'I view everything else a user sees' do
          expect(page).to have_content("#{trip_1.id}")
          expect(page).to have_content(trip_1.duration)
          expect(page).to have_content(station_1.name)
          expect(page).to have_content(station_2.name)
          expect(page).to have_content(trip_4.start_date)
          expect(page).to have_content(trip_10.end_date)
          expect(page).to have_content(trip_15.bike_id)
          expect(page).to have_content(trip_20.subscription_type)
          expect(page).to have_content(trip_30.subscription_type)
          expect(page).to_not have_content(trip_31.subscription_type)
          expect(page).to_not have_content(trip_32.subscription_type)
          expect(page).to have_selector(:link_or_button, 'Next')

          click_on "Next"

          expect(page).to have_content(trip_31.duration)
          expect(page).to have_content(trip_32.duration)
      end
    end
  end

  xcontext 'as default user' do
    scenario 'I can not see admin trips index' do
      user = User.create!(name: "Ameila Pond", email: "amelia@pond.com", password: "Rory", password_confirmation: "Rory", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit trips_path

      expect(page).to_not have_content("Admin Trips")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
  xcontext 'as visitor' do
    scenario 'I can not see admin trips index' do

      visit trips_path

      expect(page).to_not have_content("Admin Trips")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
