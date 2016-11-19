FactoryGirl.define do
  factory :artist do
    first_name        { Faker::Name.first_name }
    last_name         { Faker::Name.last_name }
    bio               { Faker::Lorem.sentence}

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
