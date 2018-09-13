require 'rails_helper'

describe 'a user should be able to decrease quantity in the cart' do
  it 'should decrease quantity of an item' do
    item_1 = Accessory.create(title: "happy1", image: "image1", description: "sogood1", price: 10.01)
    visit bike_shop_path
    first('.bike_shop_item_1').click_on("Add to Cart")
    first('.bike_shop_item_1').click_on("Add to Cart")
    expect(page).to have_content("Cart: 2")

    click_on "Cart:"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content(item_1.title)
    expect(page).to have_content("Qty: 2")
    expect(page).to have_content("Subtotal: $20.02")
    expect(page).to have_content("Total: $20.02")


     click_on "Decrease"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Qty: 1")
    expect(page).to have_content("Total: $10.01")
    expect(page).to have_content("Subtotal: $10.01")

    click_on "Decrease"
    expect(page).to have_content("Successfully removed #{@item_2.title} from your cart.")
  end
end
