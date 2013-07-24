class Person < ActiveRecord::Base
  self.inheritance_column = nil

  belongs_to :family
  attr_accessible  :name, :birthday, :telephone, :neighborhood, :city, :religion
  attr_accessible  :literacy, :email, :cellphone
  attr_accessible  :company, :position, :marital_status, :drugs, :allergies
  attr_accessible  :postal_code, :identity, :identity_issuer, :identity_expedition_date
  attr_accessible  :type, :beginning_date, :end_date, :address, :gender
  attr_accessible  :status, :cpf, :blood_type, :active, :parish, :community
  attr_accessible  :pastoral, :first_role, :second_role, :family_attributes

  

  accepts_nested_attributes_for :family, :allow_destroy => true
  
  BLOOD_TYPES = %w{ O+ O- A+ A- B+ B- AB+ AB-}
  LITERACY_TYPES = %w{ primary high elementary college post_graduation masters doctorate }
  GENDERS = %w{ masculine feminine }
  TYPES = %w{ friend servant participant }
  FUNCTIONS = %w{ accompanist assistant former panelist musician sales finances nursery marketing liturgy}
  MARITAL_STATUSES = %w{ married single divorced }
  include PersonValidations

  module Literacy
    PRIMARY = 1
    HIGH = 2
    ELEMENTARY = 3
    COLLEGE = 4
    POST_GRADUATION = 5
    MASTERS = 6
    DOCTORATE = 7

    def self.all
      self.constants.each do |constant|
        self.const_get(constant)
      end  
    end
  end

  def self.translated_literacy_types
    Person::LITERACY_TYPES.collect {|d| [I18n.t(d), d]}
  end

  def self.translated_genders
    Person::GENDERS.collect {|d| [I18n.t(d), d]}

  end

  def self.translated_types
    Person::TYPES.collect {|d| [I18n.t(d), d]}
  end

  def self.translated_functions
    Person::FUNCTIONS.collect {|d| [I18n.t(d), d]}
  end

  def self.translated_marital_statuses
    Person::MARITAL_STATUSES.collect {|d| [I18n.t(d), d]}
  end
end
