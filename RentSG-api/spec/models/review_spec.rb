require 'rails_helper'

# Test suite for the Review model
RSpec.describe Review, type: :model do
  # Association test
  # ensure an review record have reviewable_id and reviewable_type columns
  it { is_expected.to have_db_column(:reviewable_id).of_type(:integer) }
  it { is_expected.to have_db_column(:reviewable_type).of_type(:string) }

  # and belongs to a reviewable records
  it { is_expected.to belong_to(:reviewable) }
end
