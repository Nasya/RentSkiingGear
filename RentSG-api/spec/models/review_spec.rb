require 'rails_helper'

# Test suite for the Review model
RSpec.describe Review, type: :model do
  # Association test
  # ensure an review record have reviewable_id and reviewable_type columns
  it { is_expected.to have_db_column(:reviewable_id).of_type(:integer) }
  it { is_expected.to have_db_column(:reviewable_type).of_type(:string) }

  # and belongs to a reviewable records
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:reviewable) }

  context 'create review to user and item' do
    it 'shows reviews from one user to another and some item' do
      kate = User.create(name: 'Kate', email: 'asd@gmail.com',
                         phone: '123123', address: 'Lviv')
      marie = User.create(name: 'Marie', email: 'ad@gmail.com',
                          phone: '234321', address: 'Kyiv')
      snowboard = marie.items.create(name: 'Snowboard')
      rw1 = kate.reviews.create(reviewable: marie, rw_text: 'Nice')
      rw2 = kate.reviews.create(reviewable: snowboard, rw_text: 'Best board')
      rw3 = marie.authored_reviews.create(reviewable: kate, rw_text: 'Nice communication')
      expect(kate.reviews).to eq([rw1, rw2])
      expect(kate.authored_reviews).to eq([rw3])
    end
  end
end
