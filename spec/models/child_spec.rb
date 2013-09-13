require 'spec_helper'

describe Child do
  subject { FactoryGirl.create(:child) }

  it { should belong_to :family }
end
