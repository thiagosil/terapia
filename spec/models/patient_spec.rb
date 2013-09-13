require 'spec_helper'

describe Patient do
  subject { FactoryGirl.create(:patient) }

  it { should be_valid }
end
