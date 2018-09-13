require 'rails_helper'

feature 'Admin views stations index page' do
  context 'Admin views edit and delete buttons for each station' do
    context 'as an admin on the stations index page' do

      let!(:station1) { Station.create( name:              "San Jose Diridon Caltrain Station",
                                        dock_count:        27,
                                        city:              "San Jose",
                                        installation_date: "8/6/2013",
                                      )}
      let!(:station2) { Station.create( name:              "San Jose Civic Center",
                                        dock_count:        15,
                                        city:              "San Jose",
                                        installation_date: "8/5/2013",
                                      )}
      let!(:station3) { Station.create( name:              "Santa Clara",
                                        dock_count:        11,
                                        city:              "San Jose",
                                        installation_date: "8/6/2013",
                                      )}

      before do
        admin = User.create!(name: "Dr.Who", email: "thedoctor@tardis.com", password: "blue", password_confirmation: "blue", role: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


        visit stations_path
      end

      scenario 'I am on the admin stations index page' do
        expect(current_path).to eq(stations_path)
        expect(page).to have_content("Admin Stations")
      end

      scenario 'I view an edit button for each station' do
        expect(page).to have_link("Edit")
        expect(page).to have_link("Delete")
      end

      scenario 'I view a delete button for each station' do
        expect(page).to have_link("Delete")
      end

      scenario 'I view everything else a user sees' do
        expect(page).to have_link(station1.name)
        expect(page).to have_content(station1.dock_count)
        expect(page).to have_content(station1.city)
        expect(page).to have_content(station1.installation_date)
        expect(page).to have_link(station2.name)
        expect(page).to have_content(station2.dock_count)
        expect(page).to have_content(station2.city)
        expect(page).to have_content(station2.installation_date)
        expect(page).to have_link(station3.name)
        expect(page).to have_content(station3.dock_count)
        expect(page).to have_content(station3.city)
        expect(page).to have_content(station3.installation_date)
      end
    end
  end

  context 'as default user' do
    scenario 'I can not see admin stations index functions' do
      user = User.create!(name: "Ameila Pond", email: "amelia@pond.com", password: "Rory", password_confirmation: "Rory", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit stations_path

      expect(page).to_not have_content("Admin Stations")
      expect(page).to_not have_link("Edit")
      expect(page).to_not have_link("Delete")
    end
  end
  context 'as visitor' do
    scenario 'I can not see admin stations index functions' do

      visit stations_path

      expect(page).to_not have_content("Admin Stations")
      expect(page).to_not have_link("Edit")
      expect(page).to_not have_link("Delete")
    end
  end
end
