FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)  }
    password_confirmation {password}
    name                  {Faker::Name.initials(number: 2)}
    self_introduction     {"よろしくお願い致します"}
    gender_id             {2}
    birthday              {"1930-1-1"}
  end
end
