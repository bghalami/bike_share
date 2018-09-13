require 'rails_helper'

feature 'Admin views station show page' do

  let!(:station) { Station.create(name:              "San Jose Diridon Caltrain Station",
                                  dock_count:        27,
                                  city:              "San Jose",
                                  installation_date: "8/6/2013",
                                  )}

  context 'Admin views edit and delete buttons for each station' do
    context 'as an admin on the station show page' do


      before do
        admin = User.create!(name: "Dr.Who", email: "thedoctor@tardis.com", password: "blue", password_confirmation: "blue", role: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit station_path(station)
      end

      scenario 'I am on the admin station show page' do
        expect(page).to have_content("Admin Station: #{station.name}")
        expect(current_path).to eq(station_path(station))
      end

      scenario 'I view an edit button for each station' do
        expect(page).to have_link("Edit")
        expect(page).to have_link("Delete")
      end

      scenario 'I view a delete button for each station' do
        expect(page).to have_link("Delete")
      end

      scenario 'I view everything else a user sees' do
        expect(page).to have_content(station.name)
        expect(page).to have_content(station.dock_count)
        expect(page).to have_content(station.city)
        expect(page).to have_content(station.installation_date)
      end
    end
  end

  context 'as default user' do
    scenario 'I can not see admin station show functions' do
      user = User.create!(name: "Ameila Pond", email: "amelia@pond.com", password: "Rory", password_confirmation: "Rory", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit station_path(station)

      expect(page).to_not have_content("Admin Station: #{station.name}")
      expect(page).to_not have_link("Edit")
      expect(page).to_not have_link("Delete")
    end
  end
  context 'as visitor' do
    scenario 'I can not see admin station show functions' do

      visit station_path(station)

      expect(page).to_not have_content("Admin Station: #{station.name}")
      expect(page).to_not have_link("Edit")
      expect(page).to_not have_link("Delete")
    end
  end
end
