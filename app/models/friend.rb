class Friend < ActiveRecord::Base
  acts_as :person, :as => :personifiable

  belongs_to :family
  accepts_nested_attributes_for :family, :allow_destroy => true

  FUNCTIONS = %w{ accompanist assistant former panelist musician sales finances nursery marketing liturgy}

  attr_accessible :cpf, :company, :parish, :community, :pastoral, :first_role
  attr_accessible :second_role, :family_attributes

  validates :cpf, length: { is: 11 }, allow_blank: true, format: /\d{11}/
  validates :first_role, inclusion: { in: FUNCTIONS, allow_nil: true }
  validates :second_role, inclusion: { in: FUNCTIONS, allow_nil: true }

  def self.translated_functions
    FUNCTIONS.collect {|d| [I18n.t(d), d]}
  end
end
