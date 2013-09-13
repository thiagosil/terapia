class Family < ActiveRecord::Base
  has_one  :person
  has_many :children

  attr_accessible :father, :mother, :number_of_children, :children_attributes

  accepts_nested_attributes_for :children, :reject_if => lambda { |a| a[:name].blank? },
    allow_destroy: true
end
