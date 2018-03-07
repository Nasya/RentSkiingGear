require 'rails_helper'

# shared examples of reviewable
shared_examples 'reviewable' do
  it { is_expected.to have_many(:reviews) }
end

