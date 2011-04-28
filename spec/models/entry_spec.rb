require 'spec_helper'

describe Entry do
  it { should belong_to(:user) }
  it { should belong_to(:ghoul) }
  it { should belong_to(:pool) }
  it { should have_one(:rule).through(:pool) }
  
  it 'should have a value of zero for a ghoul who is alive' do
    ghoul = Factory(:ghoul, :died_on => nil)
    entry = Factory(:entry, :ghoul => ghoul)
    entry.value.should == 0
  end
  
  it 'should have a value greater than zero for a ghoul who is dead' do
    entry = Factory(:entry)
    entry.value.should > 0
  end
end
