require 'rails_helper'

feature 'Admin views admin trip show page' do

    let!(:station_1){Station.create(name:"1 station",dock_count: 3, city: "Denver", installation_date: Date.strptime("03/23/2016", '%m/%d/%Y'))}
    let!(:trip) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station:station_2,bike_id: 2, subscription_type:"Subscriber", zip_code: 94127 )}
    let!(:station_2){Station.create(name:"2 station",dock_count: 3, city: "Denver", installation_date: Date.strptime("03/23/2016", '%m/%d/%Y'))}

  context 'Admin views edit and delete buttons for a trip' do
    context 'as an admin on the trip show page' do

      before do
        admin = User.create!(name: "Dr.Who", email: "thedoctor@tardis.com", password: "blue", password_confirmation: "blue", role: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit trip_path(trip)
      end

        scenario 'I am on the admin trip show page' do
          expect(current_path).to eq(trip_path(trip))
          expect(page).to have_content("Admin Trip")
        end

        scenario 'I view an edit button for a trip' do
          expect(page).to have_link("Edit")
        end

        scenario 'I view a delete button for a trip' do
          expect(page).to have_link("Delete")
        end

        scenario 'I view everything else a user sees' do
          expect(page).to have_content(trip.duration)
          expect(page).to have_content(trip.duration)
          expect(page).to have_content(station_1.name)
          expect(page).to have_content(station_2.name)
          expect(page).to have_content(trip.start_date)
          expect(page).to have_content(trip.end_date)
          expect(page).to have_content(trip.bike_id)
          expect(page).to have_content(trip.subscription_type)
        end
    end
  end

  context 'as default user' do
    xscenario 'I can not see admin trip show' do
      user = User.create!(name: "Ameila Pond", email: "amelia@pond.com", password: "Rory", password_confirmation: "Rory", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit trip_path(trip)

      expect(page).to_not have_content("Admin Trip")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
  context 'as visitor' do
    xscenario 'I can not see admin trip show' do

      visit trip_path(trip)

      expect(page).to_not have_content("Admin Trip")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
