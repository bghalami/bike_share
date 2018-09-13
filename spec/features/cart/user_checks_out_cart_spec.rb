require 'rails_helper'

describe 'As a registered user' do
  describe 'when visiting /cart with items and clicking checkout' do
    before(:each) do
      user = User.create(name: "Beemo", email: "bmo@email.com", password: "pass", password_confirmation: "pass")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      @item_1 = Accessory.create(title: "happy1", image: "image1", description: "sogood1", price: 10.01)
      @item_2 = Accessory.create(title: "happy2", image: "image2", description: "sogood2", price: 10.02)
      @item_3 = Accessory.create(title: "happy3", image: "image3", description: "sogood3", price: 10.03)

      visit bike_shop_path

      first('.bike_shop_item_2').click_on("Add to Cart")
      first('.bike_shop_item_2').click_on("Add to Cart")
      first('.bike_shop_item_3').click_on("Add to Cart")

      click_on("Cart:")

    end

    it 'directs to user dashboard' do
      click_on("Checkout")

      expect(current_path).to eq(dashboard_path)
    end
    it 'shows flash message notifying Successfully submitted your order totaling $TOTAL' do
      click_on("Checkout")

      expect(current_path).to eq(dashboard_path)

      expect(page).to have_content("Successfully submitted your order totaling $30.07")
      expect(page).to have_content("You ordered 2 items.")
    end
  end
end
describe 'as an unregistered visitor' do
  describe 'when visiting /cart with items and clicking checkout' do
    before(:each) do
      @item_1 = Accessory.create(title: "happy1", image: "image1", description: "sogood1", price: 10.01)
      @item_2 = Accessory.create(title: "happy2", image: "image2", description: "sogood2", price: 10.02)
      @item_3 = Accessory.create(title: "happy3", image: "image3", description: "sogood3", price: 10.03)

      visit bike_shop_path

      first('.bike_shop_item_2').click_on("Add to Cart")
      first('.bike_shop_item_2').click_on("Add to Cart")
      first('.bike_shop_item_3').click_on("Add to Cart")

      click_on("Cart:")

    end
    it 'redirects user to login when unregistered' do
      expect(page).to have_button("Login to Checkout")

      click_on("Login to Checkout")

      expect(current_path).to eq(login_path)
    end
  end
end