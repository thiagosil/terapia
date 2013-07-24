FactoryGirl.define do
  factory :user do
    email 'email@example.com'
    password 'pass'
    role User::Role::ADMIN
  end
end