require 'spec_helper'

describe Family do
  subject { FactoryGirl.create(:family) }
  
  it { should have_many :children }
end
