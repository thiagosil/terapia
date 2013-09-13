class Patient < ActiveRecord::Base
  attr_accessible :frequency, :psychologist

  acts_as :person, :as => :personifiable
end
