require 'rails_helper'

# Test suite for the Booking model
RSpec.describe Booking, type: :model do
  # Association test
  # ensure an booking record belongs to a single user and item records
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:item) }
end
