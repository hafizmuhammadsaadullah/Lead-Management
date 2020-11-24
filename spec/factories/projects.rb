require 'faker'

FactoryGirl.define do
  factory :project do
    name {Faker::Name.name}
    lead
    user
  end
end