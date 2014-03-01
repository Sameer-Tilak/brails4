# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    text {Faker::Lorem.sentence(10)}
    association :profile  
  end
end
