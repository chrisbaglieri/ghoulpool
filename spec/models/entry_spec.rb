require 'spec_helper'

describe Entry do
  it { should belong_to(:user) }
  it { should belong_to(:ghoul) }
  it { should belong_to(:pool) }
end
