require 'spec_helper'

describe Rule do
  it { should validate_presence_of(:function) }
  it { should belong_to(:pool) }
  it { should have_one(:entry).through(:pool) }
end
