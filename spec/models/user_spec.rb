require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should have_many(:entries) }
  it { should have_and_belong_to_many(:pools) }
  
  it "should find the pools they own" do
    owner = Factory(:user)
    Factory(:pool, :owner => owner)
    pools = Pool.owned_by owner
    pools.count.should == 1
  end
end
