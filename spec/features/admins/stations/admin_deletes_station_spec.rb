require 'rails_helper'

feature 'Admin deletes station' do
  let!(:station) { Station.create(name:              "San Jose Diridon Caltrain Station",
                                  dock_count:        27,
                                  city:              "San Jose",
                                  installation_date: "8/6/2013",
                                  )}
    context 'as admin' do
      before do
        admin = User.create!(name: "Dr.Who", email: "thedoctor@tardis.com", password: "blue", password_confirmation: "blue", role: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      end

      context 'on the station index page' do
        before do
          visit stations_path
        end
          scenario 'admin can delete a station' do
            click_on "Delete"

            expect(current_path).to eq(stations_path)
            expect(page).to have_content("Successfully deleted.")
            expect(page).to_not have_content(station.name)
          end
      end

      context 'on the station show page' do
        before do
          visit station_path(station)
        end

          scenario 'admin can delete a station' do
            click_on "Delete"
            expect(current_path).to eq(stations_path)
            expect(page).to have_content("Successfully deleted.")
            expect(page).to_not have_content(station.name)
          end
      end
    end
end
