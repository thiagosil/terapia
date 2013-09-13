require 'spec_helper'

describe Participant do
  subject { FactoryGirl.create(:participant) }

  it { should be_valid }
end
