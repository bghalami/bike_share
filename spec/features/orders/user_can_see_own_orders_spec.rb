require 'rails_helper'

describe 'accessing an order show page' do
  before(:each) do
    @admin = User.create!(name: "Finn", email: "pip@pip.com", password: "123", role: 1)
    @user1 = User.create!(name: "sue", email: "you@you.com", password: "123")
    @user2 = User.create!(name: "You", email: "p@p.com", password: "123")

    @order = @user1.orders.create!(status: "completed")
  end
  it 'as a registered user' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    visit order_path(@order)

    expect(page).to have_content(Order.last.created_at)
  end
  it 'as a different registered user' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)

    visit order_path(@order)

    expect(page).to have_content("The page you were looking for doesn't exist.")


  end
  it 'as a visitor' do

    visit order_path(@order)

    expect(page).to have_content("The page you were looking for doesn't exist.")

  end
  it 'as an admin' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit order_path(@order)

    expect(page).to have_content(Order.last.created_at)

  end
end