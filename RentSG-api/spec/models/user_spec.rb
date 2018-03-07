require 'rails_helper'

# Test suite for the User model
RSpec.describe User, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should have_many(:items).dependent(:destroy) }
  it { should have_many(:bookings).dependent(:destroy) }
  it { should have_many(:reviews).dependent(:destroy) }
end