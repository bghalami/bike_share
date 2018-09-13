require 'rails_helper'

describe 'As a registered user' do
  before(:each) do
    @user1 = User.create(name: "Beemo", email: "bmo@email.com", password: "pass", password_confirmation: "pass")
    @user2 = User.create(name: "Zebra", email: "zebra@email.com", password: "test", password_confirmation: "test")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
  end
  describe 'from user dashboard, can access edit_account_path' do

    it 'allows user to access edit_account_path' do
      visit dashboard_path

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_link("Edit Account")

      click_on "Edit Account"

      expect(current_path).to eq(edit_user_path(@user2))
    end
  end
  describe 'from the edit_account' do
    it 'allows user to modify account data' do
      visit edit_user_path(@user2)

      fill_in :user_name, with: "Herb"
      fill_in :user_email, with: "broski@broski.com"
      fill_in :user_password, with: "test"
      fill_in :user_password_confirmation, with: "test"

      click_on "Submit"

      expect(current_path).to eq(dashboard_path)
      @user2.reload
      expect(@user2.name).to eq("Herb")
      expect(@user2.email).to eq("broski@broski.com")

    end
    it 'does not allow user to modify other user account data' do
      visit edit_user_path(@user1)

      expect(page).to_not have_content("Beemo")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
