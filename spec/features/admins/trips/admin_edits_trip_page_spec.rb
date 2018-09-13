require 'rails_helper'

feature 'Admin edits trip' do
  let!(:station_1){Station.create(name:"Heimerdinger station",dock_count: 3, city: "Galway", installation_date: Date.strptime("03/23/2016", '%m/%d/%Y'))}
  let!(:trip) {Trip.create!(duration: 42, start_date: ("09/01/2018"), start_station:station_1, end_date: ("09/01/2018"), end_station: station_2, bike_id: 2, subscription_type:"Noob", zip_code: 94127 )}
  let!(:station_2){Station.create(name:"Poppy station",dock_count: 3, city: "Toronto", installation_date: Date.strptime("03/23/2016", '%m/%d/%Y'))}

  context 'as an admin on the trips index page' do
    before do
      admin = User.create!(name: "Leela", email: "leela@futurama.com", password: "purple", password_confirmation: "purple", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit trips_path
    end

    context 'when I click on Edit' do
      scenario 'it takes me to an edit form' do
        click_on "Edit"

        expect(current_path).to eq(edit_admin_trip_path(trip))
        expect(page).to have_content("Edit trip: ##{trip.id}")
        expect(page).to have_content("Duration:")
        expect(page).to have_content("Start station: #{station_1.name}")
        expect(page).to have_content("Start date:")
        expect(page).to have_content("End station: #{station_1.name}")
        expect(page).to have_content("End date:")
        expect(page).to have_content("Bike:")
        expect(page).to have_content("Subscription type:")
        expect(page).to have_content("Zip code:")
        expect(page).to have_content(station_1.name)
        expect(page).to have_content(station_2.name)
      end

      context 'when I update the form and click submit' do
        xscenario 'it updates a station' do
          click_on "Edit"
          fill_in :trip_subscription_type, with: "The best subscriber"
          click_on "Submit Changes"
          trip.reload

          expect(current_path).to eq(trip_station_path(trip))
          expect(trip).to have_content("Successfully updated!")
        end
      end
    end
  end
  context 'as an admin on the trips show page' do
    before do
      admin = User.create!(name: "Leela", email: "leela@futurama.com", password: "purple", password_confirmation: "purple", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit trip_path(trip)
    end

    context 'when I click on Edit' do
      scenario 'it takes me to an edit form' do
        click_on "Edit"

        expect(current_path).to eq(edit_admin_trip_path(trip))
        expect(page).to have_content("Edit trip: ##{trip.id}")
        expect(page).to have_content("Duration:")
        expect(page).to have_content("Start station: #{station_1.name}")
        expect(page).to have_content("Start date:")
        expect(page).to have_content("End station: #{station_1.name}")
        expect(page).to have_content("End date:")
        expect(page).to have_content("Bike:")
        expect(page).to have_content("Subscription type:")
        expect(page).to have_content("Zip code:")
        expect(page).to have_content(station_1.name)
        expect(page).to have_content(station_2.name)
      end

      context 'when I update the form and click submit' do
        xscenario 'it updates a station' do
          click_on "Edit"
          fill_in :trip_subscription_type, with: "The best subscriber"
          click_on "Submit Changes"
          trip.reload

          expect(current_path).to eq(trip_station_path(trip))
          expect(trip).to have_content("Successfully updated!")
        end
      end
    end
  end
  context 'as default user' do
    before do
      user = User.create!(name: "Bender", email: "bender@futurama.com", password: "money", password_confirmation: "money", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit edit_admin_trip_path(trip)
    end

    xscenario 'I cannot see the edit station page' do
      expect(page).to_not have_content("Edit trip: ##{trip.id}")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
  xcontext 'as a visitor' do
    before do
      visit edit_admin_trip_path(trip)
    end

    scenario 'I cannot see the edit station page' do
      expect(page).to_not have_content("Edit trip: ##{trip.id}")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end

end
