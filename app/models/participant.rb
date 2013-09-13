class Participant < ActiveRecord::Base
  acts_as :person, :as => :personifiable
end
