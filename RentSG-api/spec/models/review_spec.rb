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

  context 'when create new review' do
    let(:city) { City.create(name: 'Lviv') }
    let(:author) { city.users.create!(name: 'Kate') }
    let(:user) { city.users.create!(name: 'Marie') }
    let(:item) { user.items.create!(name: 'Snowboard') }
    let(:item2) { user.items.create!(name: 'board') }

    it 'shows it in the received reviews list for item' do
      item_review = author.authored_reviews.create(reviewable: item, rw_text: 'Best board')
      expect(item.reviews).to eq([item_review])
      expect(item_review).to be_persisted
    end

    it 'shows it in the received reviews list for user' do
      user_review = author.authored_reviews.create(reviewable: user, rw_text: 'Nice')
      expect(user.reviews).to eq([user_review])
      expect(user_review).to be_persisted
    end

    it 'shows it in the authored reviews list' do
      review = author.authored_reviews.create(reviewable: user, rw_text: 'Best board')
      expect(author.authored_reviews).to eq([review])
      expect(review).to be_persisted
    end
  end
end
