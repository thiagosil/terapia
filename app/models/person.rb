class Person < ActiveRecord::Base
  acts_as_superclass

  self.inheritance_column = nil

  attr_accessible  :name, :birthday, :telephone, :neighborhood, :city
  attr_accessible  :literacy, :email, :cellphone
  attr_accessible  :position, :marital_status, :drugs, :allergies
  attr_accessible  :postal_code, :identity, :identity_issuer, :identity_expedition_date
  attr_accessible  :type, :beginning_date, :end_date, :address, :gender
  attr_accessible  :status, :blood_type, :active

  BLOOD_TYPES = %w{ O+ O- A+ A- B+ B- AB+ AB-}
  LITERACY_TYPES = %w{ primary high elementary college post_graduation masters doctorate }
  GENDERS = %w{ masculine feminine }
  TYPES = %w{ friend servant participant }
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

  def self.translated_marital_statuses
    Person::MARITAL_STATUSES.collect {|d| [I18n.t(d), d]}
  end

  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end
end
