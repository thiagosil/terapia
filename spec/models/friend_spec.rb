require 'spec_helper'

describe Friend do
  subject { FactoryGirl.create(:friend) }

  it { should be_valid }

  it { should belong_to :family }

  it { should ensure_inclusion_of(:first_role).in_array(Friend::FUNCTIONS) }
  it { should ensure_inclusion_of(:second_role).in_array(Friend::FUNCTIONS) }
  
  it { should allow_value("").for(:cpf)}
  it { should allow_value(nil).for(:cpf)}
  it { should allow_value("07369316602").for(:cpf)}
  it { should_not allow_value("ABCDEFGHIJK").for(:cpf)}
  it { should_not allow_value("123456").for(:cpf)}
end
