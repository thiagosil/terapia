class Person < ActiveRecord::Base
  self.inheritance_column = nil

  attr_accessible  :name, :birthday, :telephone, :neighborhood, :city, :religion
  attr_accessible  :literacy, :father, :mother, :email, :cellphone
  attr_accessible  :company, :position, :marital_status, :drugs, :allergies
  attr_accessible  :postal_code, :identity, :identity_issuer, :identity_expedition_date
  attr_accessible  :type, :beginning_date, :end_date, :address, :gender, :accompanist

  validates :name, presence: true
  validates :type, presence: true
  validates :beginning_date, presence: true
  validates :end_date, presence: true
end
