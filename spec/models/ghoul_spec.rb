require 'spec_helper'

describe Ghoul do
  it { should validate_presence_of(:freebase_id) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:born_on) }
  it { should have_many(:entries) }
  
  [:freebase_id, :name].each do |field|
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
  
  it 'should search freebase and find matches' do
    ghouls = Ghoul.search("Charlie Sheen")
    ghouls[0].should == "/en/charlie_sheen"
  end
  
  it 'should sync from freebase for a ghoul who has not yet crossed over' do
    ghoul = Factory(:ghoul, :freebase_id => '/en/charlie_sheen')
    ghoul.sync.should == true
  end
  
  it 'should sync from freebase for a ghoul who has crossed over' do
    ghoul = Factory(:ghoul, :freebase_id => '/en/elizabeth_taylor')
    ghoul.sync.should == true
  end
  
  it 'should not sync from freebase for a fake ghoul' do
    ghoul = Factory(:ghoul, :freebase_id => '/en/charlie_sheeno')
    ghoul.sync.should == false
  end
end
