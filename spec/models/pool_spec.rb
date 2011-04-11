require 'spec_helper'

describe Pool do
  
  [:name, :picks].each do |field|
    it 'should require #{field} on create' do
      Factory.build(:pool, field => nil).save.should be_false
    end
  end
  
end
