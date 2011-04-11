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
end
