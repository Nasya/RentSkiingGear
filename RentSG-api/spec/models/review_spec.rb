require 'rails_helper'

# Test suite for the Review model
RSpec.describe Review, type: :model do
  # Association test
  # ensure an booking record belongs to a single user and item records
  it { should belong_to(:user) }
  it { should belong_to(:item) }
end