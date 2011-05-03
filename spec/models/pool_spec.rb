require 'spec_helper'

describe Pool do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:picks) }
  it { should have_many(:entries) }
  it { should have_one(:rule) }
  it { should have_many(:entries) }
  it { should belong_to(:owner) }
  it { should have_and_belong_to_many(:users) }
  
  it "should be able to calculate its score" do
    pool = Factory(:pool)
    ghoul = Factory(:dead_ghoul)
    entry = pool = Factory(:entry, :pool => pool, :ghoul => ghoul)
    pool.points.should >= 0
  end
  
  describe "owners" do
    before do
      @owner = Factory(:user)
    end
    
    it "should be able to check if they own a pool" do
      pool = Factory(:pool, :owner => @owner)
      pool.owned_by?(@owner).should == true
    end
  end
  
end
