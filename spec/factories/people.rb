#encoding: UTF-8
FactoryGirl.define do
  factory :person do
    name 'João de Deus'
    type 'friend'
    beginning_date Date.new(2010, 2, 17)
    cpf 12345678910
    postal_code 22060000
    blood_type 'O+'
    telephone 2144445555
  end
end