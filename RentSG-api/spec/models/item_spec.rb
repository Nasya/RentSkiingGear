require 'rails_helper'
require 'models/reviewable_spec'

# Test suite for the Item model
RSpec.describe Item, type: :model do
  # Association test
  # ensure an item record belongs to a single user record
  it { is_expected.to belong_to(:user) }

  # and behaves like reviewable
  it_behaves_like 'reviewable'
end
