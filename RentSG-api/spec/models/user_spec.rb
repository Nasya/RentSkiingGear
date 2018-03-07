require 'rails_helper'
require 'models/reviewable_spec'

# Test suite for the User model
RSpec.describe User, type: :model do
  # Association test
  # ensure an user record have many items, bookings and reviews records
  it { is_expected.to have_many(:items).dependent(:destroy) }
  it { is_expected.to have_many(:bookings).dependent(:destroy) }
  it { is_expected.to have_many(:reviews).dependent(:destroy) }

  # and behaves like reviewable
  it_behaves_like 'reviewable'
end