require 'spec_helper'

describe Pool do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:picks) }
  it { should have_many(:entries) }
  it { should have_one(:rule) }
  it { should have_many(:entries) }
  it { should belong_to(:owner) }
  it { should have_and_belong_to_many(:users) }
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:description) }
  it { should allow_mass_assignment_of(:picks) }
  it { should allow_mass_assignment_of(:rule_attributes) }
  
  it "should not have picks less than zero" do
    pool = Factory(:pool)
    pool.picks = -1
    pool.should_not be_valid
  end
  
  it "should be able to calculate its score for a given user" do
    pool = Factory(:pool)
    ghoul = Factory(:living_ghoul)
    entry = Factory(:entry, :pool => pool, :ghoul => ghoul, :owner => pool.owner, :points => 10)
    ghoul.died_on = Date.today
    ghoul.save
    pool.points.should > 0
  end
  
  it "should be able to fetch a user's entries" do
    pool = Factory(:pool)
    ghoul = Factory(:living_ghoul)
    entry = Factory(:entry, :pool => pool, :ghoul => ghoul, :owner => pool.owner, :points => 10)
    pool.user_entries(pool.owner).count.should == 1
  end
end
