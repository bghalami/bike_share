require 'rails_helper'

feature 'User views a navbar' do
  context 'as a guest' do
    scenario 'user views the guest version of the navbar' do
      visit root_path

    within(".navbar") do
      expect(page).to have_content("Bike Share")
      expect(page).to have_link("Stations")
      expect(page).to have_link("Trips")
      expect(page).to have_link("Conditions")
      expect(page).to have_link("Log In")
      expect(page).to have_link("Cart")

      ## uncomment this later ##
      # expect(page).to_not have_link("Log Out")
    end
    end
  end
end
