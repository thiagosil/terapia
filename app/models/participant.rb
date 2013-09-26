class Participant < ActiveRecord::Base
  acts_as :person, :as => :personifiable
  attr_accessible :parish, :community, :pastoral
end
