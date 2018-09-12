require 'rails_helper'

feature 'Admin creates station' do
  let!(:station) { Station.create(name:              "San Jose Diridon Caltrain Station",
                                  dock_count:        27,
                                  city:              "San Jose",
                                  installation_date: "8/6/2013",
                                  )}
  context 'as an admin' do

    before do
      admin = User.create!(name: "Dr.Who", email: "thedoctor@tardis.com", password: "blue", password_confirmation: "blue", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_stations_path
    end

    context 'when I click on Create Station' do
      scenario 'it takes me to a new station form' do
        click_on "Create Station"

        expect(current_path).to eq(new_admin_station_path)
        expect(page).to have_content("Create a new station:")
        expect(page).to have_content("Name:")
        expect(page).to have_content("Dock count:")
        expect(page).to have_content("City:")
        expect(page).to have_content("Installation date:")
        expect(page).to have_button("Submit")
      end
      context 'when I update the form and click submit' do
        scenario 'it creates a station' do
          click_on "Create Station"
          fill_in :station_name, with: "Madrid Spain Station"
          fill_in :station_dock_count, with: 42
          fill_in :station_city, with: "Madrid"
          fill_in "Installation date", with: '10/10/2010'
          # page.find('#installation_date').set('10/10/2010')
          # select '01/02/2011', :from => "Installation date"
          # select_date("Installation date", :with => "1/1/2011")

          click_on "Submit"

          station = Station.last
          station.reload

          expect(current_path).to eq(admin_station_path(station))
          expect(page).to have_content("Successfully created #{station.name}!")
          expect(page).to have_content(station.name)
          expect(page).to have_content(station.dock_count)
          expect(page).to have_content(station.city)
          expect(page).to have_content(station.installation_date)
        end
      end
    end
  end
  context 'as default user' do
    before do
      user = User.create!(name: "Dalek", email: "dalek@email.com", password: "hack", password_confirmation: "hack", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit edit_admin_station_path(station)
    end
    scenario 'I cannot see the new station page' do
      expect(page).to_not have_content("Create Station")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
  context 'as visitor' do
    before do
      visit edit_admin_station_path(station)
    end
    scenario 'I cannot see the edit station page' do
      expect(page).to_not have_content("Create Station")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
