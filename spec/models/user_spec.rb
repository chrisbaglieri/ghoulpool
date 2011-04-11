require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should have_many(:entries) }
  it { should have_and_belong_to_many(:pools) }
end
