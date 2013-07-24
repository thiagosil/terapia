class Child < ActiveRecord::Base
  attr_accessible :age, :name

  belongs_to :family
end
