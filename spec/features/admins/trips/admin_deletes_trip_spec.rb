require 'rails_helper'

feature 'Admin can delete a trip spec' do
  let!(:station_1){Station.create(name:"a station",dock_count: 3, city: "Bangladesh", installation_date: Date.strptime("03/23/2016", '%m/%d/%Y'))}
  let!(:station_2){Station.create(name:"z station",dock_count: 3, city: "Bangladesh", installation_date: Date.strptime("03/23/2016", '%m/%d/%Y'))}
  let!(:trip) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}


  context 'as admin' do
    before do
      admin = User.create!(name: "Charizard", email: "charizard@ashe.com", password: "valor", password_confirmation: "valor", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    end

    context 'on the trip index page' do
      before do
        visit trips_path
      end
        scenario 'admin can delete a trip' do
          click_on "Delete"

          expect(current_path).to eq(trips_path)
          expect(page).to have_content("Successfully deleted.")
          expect(page).to_not have_content("#{trip.id}")
        end
      end

    context 'on the trip show page' do
      before do
        visit trip_path(trip)
      end

        scenario 'admin can delete a trip' do
          click_on "Delete"
          expect(current_path).to eq(trips_path)
          expect(page).to have_content("Successfully deleted.")
          expect(page).to_not have_content("#{trip.id}")
        end
    end
  end
end
