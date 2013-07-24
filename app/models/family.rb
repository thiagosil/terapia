class Family < ActiveRecord::Base
  attr_accessible :father, :mother, :number_of_children

  has_one  :person
  has_many :children

  accepts_nested_attributes_for :children, :reject_if => lambda { |a| a[:content].blank? },
    allow_destroy: true
end
