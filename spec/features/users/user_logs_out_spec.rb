require 'rails_helper'

feature 'Registered user can log out' do
  context 'as a registered user' do

    let!(:user) {User.create!(name: "Beemo", email: "bmo@email.com", password: "pass", password_confirmation: "pass")}
    before do
      visit root_path
      click_on "Log In"
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_on "Submit"
    end

    context 'when I click on log out' do
      scenario 'I can log out' do

        click_on "Log Out"

        expect(page).to have_content("Log In")
        expect(page).to have_content("Successfully logged out.")
        expect(page).to_not have_content("Log Out")
        expect(current_path).to eq(root_path)
      end
    end
  end
end
