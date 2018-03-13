require 'rails_helper'

# Test suite for the City model
RSpec.describe City, type: :model do
  # Association test
  # ensure an item record belongs to a single user record
  it { is_expected.to have_many(:users).dependent(:destroy) }

  context 'when create new user' do
    let(:city) { City.create(name: 'Lviv') }
    let(:user) { city.users.create(name: 'Marie') }

    it 'shows it in the received users list for city' do
      users_list = city.users.create(name: 'Mike')
      expect(city.users).to eq([users_list])
      expect(users_list).to be_persisted
    end

    it 'shows it in the received item list for city' do
      items_list = user.items.create(name: 'some_item')
      expect(city.items).to eq([items_list])
      expect(items_list).to be_persisted
    end
  end
end