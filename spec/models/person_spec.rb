require 'spec_helper'

describe Person do
  subject { FactoryGirl.create(:person) }

  it { should be_valid }
  it { should belong_to :family }
  it { should validate_presence_of :name }
  it { should validate_presence_of :type }
  it { should validate_presence_of :beginning_date }
  it { should ensure_inclusion_of(:blood_type).in_array(Person::BLOOD_TYPES) }
  it { should ensure_inclusion_of(:literacy).in_array(Person::LITERACY_TYPES) }
  it { should ensure_inclusion_of(:gender).in_array(Person::GENDERS) }
  it { should ensure_inclusion_of(:first_role).in_array(Person::FUNCTIONS) }
  it { should ensure_inclusion_of(:second_role).in_array(Person::FUNCTIONS) }
  it { should ensure_inclusion_of(:marital_status).in_array(Person::MARITAL_STATUSES) }

  it { should allow_value("07369316602").for(:cpf)}
  it { should_not allow_value("ABCDEFGHIJK").for(:cpf)}
  it { should_not allow_value("123456").for(:cpf)}

  it { should allow_value("12345678").for(:postal_code)}
  it { should_not allow_value("123456789").for(:postal_code)}
  it { should_not allow_value("postal_code").for(:postal_code)}
  it { should_not allow_value("postalcod").for(:postal_code)}

  it { should allow_value("3138299999").for(:telephone)}
  it { should_not allow_value("38299999").for(:telephone)}
  it { should_not allow_value("ABCDEFGHIJK").for(:telephone)}
  it { should_not allow_value("ABCDE").for(:telephone)}

  it { should allow_value("3138299999").for(:cellphone)}
  it { should_not allow_value("38299999").for(:cellphone)}
  it { should_not allow_value("ABCDEFGHIJK").for(:cellphone)}
  it { should_not allow_value("ABCDE").for(:cellphone)}
end