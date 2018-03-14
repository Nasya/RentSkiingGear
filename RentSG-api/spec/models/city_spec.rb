require 'rails_helper'

# Test suite for the City model
RSpec.describe City, type: :model do
  # Association test
  # ensure an item record belongs to a single user record
  it { is_expected.to have_many(:users).dependent(:destroy) }

  context 'when create new user' do
    let(:city) { City.create(name: 'Kyiv', id: 4) }

    it 'shows it in the users list for city' do
      user = city.users.create(name: 'Mike')
      expect(city.users).to eq([user])
      expect(user).to be_persisted
    end

    it 'shows items of the user in the items list for city' do
      user = city.users.create(name: 'Mike')
      5.times { user.items.create(name: 'some_item') }

      expect(city.items).to eq(user.items)
    end
  end
end