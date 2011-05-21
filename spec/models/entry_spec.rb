require 'spec_helper'

describe Entry do
  it { should belong_to(:owner) }
  it { should belong_to(:ghoul) }
  it { should belong_to(:pool) }
  it { should have_one(:rule).through(:pool) }
  it { should allow_mass_assignment_of(:ghoul_attributes) }
  
  it 'should have a value of zero for a ghoul who is alive' do
    entry = Factory(:entry)
    entry.value.should == 0
  end
  
  it 'should have a value greater than zero for a ghoul who is dead' do
    entry = Factory(:entry)
    entry.ghoul.died_on = Date.today
    entry.ghoul.save
    entry.value.should > 0
  end
  
  it "should not create for a dead ghoul" do
    ghoul = Factory(:dead_ghoul)
    entry = Factory.build(:entry, :ghoul => ghoul)
    entry.should_not be_valid
  end
  
  it "should not create for a ghoul that is not already in a user's pool" do
    entry1 = Factory(:entry)
    entry2 = Factory.build(:entry, :owner => entry1.owner, :ghoul => entry1.ghoul, :pool => entry1.pool)
    entry2.should_not be_valid
  end
end
