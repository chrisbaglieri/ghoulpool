require 'spec_helper'

describe Ghoul do
  
  [:name, :born_on].each do |field|
    it 'should require #{field} on create' do
      Factory.build(:ghoul, field => nil).save.should be_false
    end
  end
  
end
