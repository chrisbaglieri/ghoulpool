require 'spec_helper'

describe Ghoul do
  
  [:name, :born_on].each do |field|
    it 'should require #{field} on create' do
      Factory.build(:ghoul, field => nil).save.should be_false
    end
  end
  
  [:name, :freebase_id].each do |field|
    it 'should validate uniqueness of #{field} on create' do
      Factory(:ghoul, field => 'foo')
      Factory.build(:ghoul, field => 'foo').save.should be_false
    end
  end
  
end
