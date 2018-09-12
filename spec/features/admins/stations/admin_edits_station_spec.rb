require 'rails_helper'

feature 'Admin edits station' do
  let!(:station) { Station.create(name:              "San Jose Diridon Caltrain Station",
                                  dock_count:        27,
                                  city:              "San Jose",
                                  # installation_date: '10/10/2010',
                                  installation_date: Date.strptime("8/6/2013", "%m/%d/%Y")
                                  )}
  context 'as an admin' do

    before do
      admin = User.create!(name: "Dr.Who", email: "thedoctor@tardis.com", password: "blue", password_confirmation: "blue", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_stations_path
    end

    context 'when I click on Edit' do
      scenario 'it takes me to an edit form' do
        click_on "Edit"
        expect(current_path).to eq(edit_admin_station_path(station))
        expect(page).to have_content("Edit #{station.name}")
        expect(page).to have_content("Name:")
        expect(page).to have_content("Dock count:")
        expect(page).to have_content("City:")
        expect(page).to have_content("Installation date:")
        expect(page).to have_button("Submit Changes")
      end
      context 'when I update the form and click submit' do
        scenario 'it updates a station' do
          click_on "Edit"
          fill_in :station_dock_count, with: 42
          # save_and_open_page
          binding.pry
          click_on "Submit Changes"

          expect(current_path).to eq(admin_station_path(station))
          expect(station.dock_count).to eq(42)
          expect(page).to have_content("Successfully updated!")
        end
      end
    end
  end
  context 'as default user' do
    before do
      user = User.create!(name: "Evil Hacker", email: "hacker@email.com", password: "hack", password_confirmation: "hack", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit edit_admin_station_path(station)
    end
    scenario 'I cannot see the edit station page' do
      expect(page).to_not have_content("Edit #{station.name}")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
  context 'as visitor' do
    before do
      visit edit_admin_station_path(station)
    end
    scenario 'I cannot see the edit station page' do
      expect(page).to_not have_content("Edit #{station.name}")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end

end
