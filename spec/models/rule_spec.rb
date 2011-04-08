require 'spec_helper'

describe Rule do
  
  [:function].each do |field|
    it 'should require #{field} on create' do
      Factory.build(:rule, field => nil).save.should be_false
    end
  end
  
end
