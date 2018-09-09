require 'rails_helper'
describe User, type: :model do
  it 'exists' do
    expect(User).to be
  end
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
  end

  describe 'roles' do
    it 'can be created as a default user' do
      user = User.create(name: "underling", email: 'underling@email.com')

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end
  end
end
