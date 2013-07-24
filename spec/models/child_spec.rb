require 'spec_helper'

describe Child do
  subject { FactoryGirl.create(:person) }

  it { should belong_to :family }
end
