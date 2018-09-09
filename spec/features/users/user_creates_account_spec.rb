require 'rails_helper'

feature 'New user can create an account' do
  context 'As a visitor' do
    context 'when I visit "/" and click on Log In' do
      scenario 'I am on the "/login" page and view link to Create Account' do
        visit root_path

        click_on "Log In"

        expect(current_path).to eq(login_path)
        expect(page).to have_link("Create Account")
      end
    context 'on the login page' do
        context 'I click on Create Account' do
          context 'I fill out form and click submit' do
            scenario 'I create a new user account' do

              visit login_path

              click_on "Create Account"

              expect(current_path).to eq(new_user_path)

              fill_in :user_name, with: "Finn"
              fill_in :user_email, with: "finn@jake.com"
              fill_in :user_password, with: "123"
              fill_in :user_password_confirmation, with: "123"

              click_on "Submit"

              user = User.last

              expect(user.name).to eq("Finn")
              expect(user.email).to eq("finn@jake.com")
              expect(current_path).to eq(dashboard_path)
            end
          end
        end
      end
    end
  end
end
