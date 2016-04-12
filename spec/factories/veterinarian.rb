FactoryGirl.define do
  factory :veterinarian do
    organization_name { Faker::Company.name }
    vet_name { Faker::Name.name }
  end
end
