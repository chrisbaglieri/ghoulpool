require 'spec_helper'

describe Ranking do
  it { should belong_to(:pool) }
  it { should belong_to(:user) }
end
