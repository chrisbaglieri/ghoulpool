require 'spec_helper'

describe Ghoul do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:born_on) }
  it { should have_many(:entries) }
  
  [:name, :freebase_id].each do |field|
    it 'should validate uniqueness of #{field} on create' do
      Factory(:ghoul, field => 'foo')
      Factory.build(:ghoul, field => 'foo').save.should be_false
    end
  end
  
  it 'should know someone is alive' do
    ghoul = Factory(:ghoul, :freebase_id => '/en/charlie_sheen')
    ghoul.alive?.should == true
  end
  
  it 'should know someone is dead' do
    ghoul = Factory(:ghoul, :freebase_id => '/en/elizabeth_taylor')
    ghoul.alive?.should == true
  end
end
