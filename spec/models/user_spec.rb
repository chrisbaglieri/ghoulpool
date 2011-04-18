require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should have_many(:entries) }
  it { should have_and_belong_to_many(:pools) }
  
  describe "owners" do
    before do
      @owner = Factory(:user)
    end

    it "should find the pools they own" do
      Factory(:pool, :owner => @owner)
      pools = Pool.owned_by @owner
      pools.count.should == 1
    end

    it "should automatically be added to the pools they own" do
      Factory(:pool, :owner => @owner)
      pools = @owner.pools
      pools.count.should == 1
    end
  end
end
