require 'spec_helper'

describe User do
  
  [:email].each do |field|
    it 'should require #{field} on create' do
      Factory.build(:user, field => nil).save.should be_false
    end
  end
  
end
