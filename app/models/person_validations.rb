module PersonValidations
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true
    validates :type, presence: true
    validates :beginning_date, presence: true
    validates :cpf, length: { is: 11 }, allow_blank: true
    validates :cpf, format: /\d{11}/
    validates :postal_code, length: { is: 8 }, allow_blank: true, format: /\d{8}/
    validates :telephone, length: { minimum: 10 }, allow_blank: true, format: /\d{10,}/
    validates :cellphone, length: { minimum: 10 }, allow_blank: true, format: /\d{10,}/
    validates :blood_type, :inclusion => { in: Person::BLOOD_TYPES, allow_nil: true }
    validates :gender, inclusion: { in: Person::GENDERS, allow_nil: true }
    validates :literacy, inclusion: { in: Person::LITERACY_TYPES, allow_nil: true }
    validates :first_role, inclusion: { in: Person::FUNCTIONS, allow_nil: true }
    validates :second_role, inclusion: { in: Person::FUNCTIONS, allow_nil: true }
    validates :marital_status, inclusion: { in: Person::MARITAL_STATUSES, allow_nil: true }
  end
end